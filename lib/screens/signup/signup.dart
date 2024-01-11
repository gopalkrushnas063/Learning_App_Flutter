import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning_app/components/background.dart';
import 'package:learning_app/screens/login/login_screen.dart';
import 'package:learning_app/services/api_services.dart';
import 'package:http/http.dart' as http;


class RegisterScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> registerUser(BuildContext context) async {
    var url = Uri.parse('http://localhost:8090/user/register');
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "name": nameController.text,
      "phoneNumber": phoneNumberController.text,
      "email": emailController.text,
      "password": passwordController.text
    });

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 202) {
      // Show an alert
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registration Successful'),
            content: const Text('Details recorded successfully!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle other response codes here
      print('Registration failed with status ${response.statusCode}');
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
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
                    fontSize: 36),
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
                 onPressed: () {
            registerUser(context); // Pass the context here
          },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: new LinearGradient(colors: [
                        Color.fromARGB(255, 28, 140, 16),
                        Color.fromARGB(255, 113, 201, 31),
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "SIGN UP",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()))
                },
                child: Text(
                  "Already Have an Account? Sign in",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
