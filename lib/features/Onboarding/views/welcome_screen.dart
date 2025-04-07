import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_app/Utilities/Routes/route_names.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.lightGreen));
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Stack(
              children: [
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight / 1.6,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 238, 250, 241),
                  ),
                ),
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70),
                    ),
                  ),
                  child: Container(
                    child: Image.asset(
                      "assets/images/banner_img.png",
                      scale: 0.8,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight / 2.666,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight / 2.666,
                    padding: EdgeInsets.only(
                      top: constraints.maxHeight * 0.03,
                      bottom: constraints.maxHeight * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 250, 241),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Learning is Everything",
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.07,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            wordSpacing: 2,
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.015),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: constraints.maxWidth * 0.1,
                          ),
                          child: Text(
                            'Learning with Pleasure with Dear Programmer, Whenever you are.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.06),
                        Material(
                          color: Color.fromARGB(255, 238, 250, 241),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              context.go(RouteNames.mainAuth);
                            },
                            child: ClayContainer(
                              width: 250,
                              height: 60,
                              color: Color.fromARGB(255, 238, 250, 241),
                              borderRadius: 15,
                              child: Center(
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: constraints.maxWidth * 0.06,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
