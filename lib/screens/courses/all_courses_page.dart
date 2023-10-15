import 'package:flutter/material.dart';

class AllCourseList extends StatelessWidget {
  List imgList = [
    'c_sharp',
    'react_native',
    'Python',
    'Flutter',
  ];

  List courseList = [
    'C#',
    'React Native',
    'Python',
    'Flutter',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: courseList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/${imgList[index]}.png",
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(width: 20),
                      Text("${courseList[index]}",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
