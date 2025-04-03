import 'package:flutter/material.dart';
import 'package:learning_app/Utilities/Routes/routes.dart';
import 'package:learning_app/features/Onboarding/views/welcome_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 238, 250, 241),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: WelcomeScreen(),
    );
  }
}
