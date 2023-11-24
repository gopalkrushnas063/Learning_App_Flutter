import 'package:clay_containers/clay_containers.dart';
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
    double gridItemWidth = MediaQuery.of(context).size.width / 2 - 15; 
    double gridItemHeight = gridItemWidth * 1.2; 

    return Column(
      
      children: [
        Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClayText(
              "Courses",
              size: 23,
              textColor: Colors.black,
            ),
            ClayText(
              "See All",
              size: 20,
              textColor: Colors.black,
              emboss: false,
              
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          color: Color.fromARGB(255, 238, 250, 241),
          child: GridView.builder(
            itemCount: imgList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: gridItemWidth / gridItemHeight,
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
                child: ClayContainer(
                  curveType: CurveType.none,
                  width: gridItemWidth,
                  height: gridItemHeight,
                  borderRadius: 20,
                  color: Color.fromARGB(255, 238, 250, 241),
                 
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
                      ClayText(
                        courseList[index],
                        size: 21,
                        color: Color.fromARGB(255, 238, 250, 241),
                        textColor: Colors.black,
                        emboss: false,
                      ),
                      SizedBox(height: 10),
                      ClayText(
                        '55 Videos',
                        size: 15,
                        color: Color.fromARGB(255, 238, 250, 241),
                        textColor: Colors.black,
                        emboss: false,
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
