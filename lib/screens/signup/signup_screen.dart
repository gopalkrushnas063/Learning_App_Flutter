// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:learning_app/screens/login/login_screen.dart';
// import 'package:learning_app/screens/signup/signup.dart';
// import 'package:lottie/lottie.dart';
// import 'package:clay_containers/clay_containers.dart';

// class SignupScreen extends StatelessWidget {
//   const SignupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 238, 250, 241)));
//     Color baseColor = Color.fromARGB(255, 238, 250, 241);
//     return Scaffold(

//       body: SafeArea(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 238, 250, 241),
//           ),
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   ClayText(
//                     "Hello There!",
//                     emboss: false,
//                     size: 40,
//                     color: Colors.lightGreen,
//                     textColor: Colors.lightGreen,
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),

//                    SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     child: Lottie.asset(
//                       'assets/images/illustration.json',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(height: 120),
//                   GestureDetector(
//                     onTap: (){
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => LoginScreen(),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       color: baseColor,
//                       child: Center(
//                         child: ClayContainer(
//                           color: baseColor,
//                           height: 60,
//                           width: 280,
//                           borderRadius: 15,
//                           child: Center(
//                               child: ClayText(
//                             "Login",
//                             emboss: false,
//                             textColor: Colors.lightGreen,
//                             color: Colors.lightGreen,
//                             size: 25,
//                           )),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 40),
//                   GestureDetector(
//                     onTap: (){
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => RegisterScreen(),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       color: baseColor,
//                       child: Center(
//                         child: ClayContainer(
//                           color: baseColor,
//                           height: 60,
//                           width: 280,
//                           borderRadius: 15,
//                           child: Center(
//                               child: ClayText(
//                             "Signup",
//                             emboss: false,
//                             textColor: Colors.lightGreen,
//                             color: Colors.lightGreen,
//                             size: 25,
//                           )),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_app/components/background.dart';
import 'package:learning_app/screens/login/login_screen.dart';
import 'package:learning_app/screens/signup/signup.dart';
import 'package:lottie/lottie.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/images/main.json', // Replace with your JSON file path
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.6,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: new LinearGradient(colors: [
                        Color.fromARGB(255, 28, 140, 16),
                        Color.fromARGB(255, 113, 201, 31),
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.6,
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
          ],
        ),
      ),
    );
  }
}
