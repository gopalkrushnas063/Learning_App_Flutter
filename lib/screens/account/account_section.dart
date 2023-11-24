import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = Colors.lightGreen;
    return ClayContainer(
      color: baseColor,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            ClayContainer(
              color: baseColor,
              height: 120, 
              width: 120, 
              borderRadius: 50,
              child: Container(
                padding: EdgeInsets.all(10), 
                child: Image.asset(
                  "assets/images/Python.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 15),
            ClayText(
              "Gopal Krushna Sahoo",
              color: baseColor,
              textColor: baseColor,
              size: 30,
            ),
            
          ],
        ),
      ),
    );
  }
}
