// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/Utilities/Routes/app_router.dart';
import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/services/storage_service.dart';
import 'package:learning_app/theme/light_and_dark_theme.dart';
import 'package:learning_app/theme/provider/theme_provider.dart';
import 'package:path_provider/path_provider.dart';

late String tempPath;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tempPath = (await getTemporaryDirectory()).path;
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.read(storageProvider);

    final theme = ref.watch(themeProvider);
    // Lock orientation to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Set status bar color based on the theme
    SystemChrome.setSystemUIOverlayStyle(
      theme == darkTheme
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent, // or any dark color
              statusBarIconBrightness:
                  Brightness.light, // Light icons for dark theme
            )
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent, // or any light color
              statusBarIconBrightness:
                  Brightness.dark, // Dark icons for light theme
            ),
    );

    return FutureBuilder(
      future: storage.read(key: SecureStorageKeys.LOGIN_TOKEN.name),
      builder: (context, snapshot) {
        // Show loading indicator while checking auth status
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        // If user is logged in (has email in storage), go to HomePage
        final isLoggedIn = snapshot.hasData && snapshot.data!.isNotEmpty;
        final appRouter = AppRouter(isLoggedIn);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
                theme: lightTheme, // Light theme

          routerConfig: appRouter.router,  
          darkTheme: darkTheme, // Dark theme
          themeMode: theme == darkTheme
              ? ThemeMode.dark
              : ThemeMode.light, // Set the theme mode
        );
      },
    );
  }
}
