import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:animated_neumorphic/animated_neumorphic.dart';

class CustomAppBar extends StatelessWidget {
  late final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {

    Color baseColor = Colors.lightGreen;


    return Container(
      padding: EdgeInsets.only(
        top: 15,
        right: 15,
        left: 15,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 3,
              bottom: 15,
            ),
            child: ClayText(
              "Hi Learner",
              color: Colors.lightGreen,
              textColor: Colors.lightGreen,
              size: 35,
              
            ),
          ),
          
          ClayContainer(
            borderRadius: 75,
              curveType: CurveType.concave,
            width: MediaQuery.of(context).size.width,
            height: 55,
            color: baseColor,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search here...",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 25,
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}
