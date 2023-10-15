import 'package:flutter/material.dart';
import 'package:learning_app/screens/courses/course_screen.dart';

class CoursesGrid extends StatelessWidget {
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Courses",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "See All",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF674AEF),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          child: GridView.builder(
            itemCount: imgList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  (MediaQuery.of(context).size.height - 50 - 25) / (4 * 240),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseScreen(imgList[index])),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFF5F3FF),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/${imgList[index]}.png",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        courseList[index],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '55 Videos',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
