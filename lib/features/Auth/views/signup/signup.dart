import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Auth/controllers/auth.controller.dart';
import 'package:learning_app/features/Auth/models/signup_model.dart';
import 'package:learning_app/features/Auth/views/login/login_screen.dart';
import 'package:learning_app/features/Onboarding/widgets/components/background.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isNavigating = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _register() async {
    final signup = SignupModel(
      name: nameController.text,
      phoneNumber: phoneNumberController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    await ref.read(authControllerProvider.notifier).signup(signup);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final size = MediaQuery.of(context).size;

    // Handle state changes
    if (authState.state == AuthState.success && !_isNavigating) {
      _isNavigating = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
        _showSnackBar(authState.message ?? 'Registration successful');
      });
    } else if (authState.state == AuthState.error) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showSnackBar(authState.error ?? 'Registration failed');
      });
    }

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "SIGNUP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen,
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(labelText: "Mobile Number"),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: MaterialButton(
                  onPressed: authState.state == AuthState.loading ? null : _register,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 28, 140, 16),
                          Color.fromARGB(255, 113, 201, 31),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(0),
                    child: authState.state == AuthState.loading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "SIGN UP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "Already Have an Account? Sign in",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}