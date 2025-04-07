// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/Utilities/Routes/app_router.dart';
import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/services/storage_service.dart';
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
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 238, 250, 241),
            ),
            useMaterial3: true,
          ),
          routerConfig: appRouter.router,
        );
      },
    );
  }
}