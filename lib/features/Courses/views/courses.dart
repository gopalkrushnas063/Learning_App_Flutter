import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/features/Courses/widgets/course_details.dart';

class Courses extends StatelessWidget {
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
    double gridItemWidth = MediaQuery.of(context).size.width / 2 -
        15; // Adjust the width based on screen size
    double gridItemHeight =
        gridItemWidth * 1.2; // Maintain the same aspect ratio

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Courses",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "See All",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.lightGreen,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          child: ListView.builder(
            itemCount: imgList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseDetails(imgList[index])),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ClayContainer(
                    borderRadius: 20,
                    color: Color.fromARGB(255, 238, 250, 241),
                    curveType: CurveType.none,
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/images/${imgList[index]}.png",
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    courseList[index],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '55 Materials',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.fast_forward,
                            color: Colors.lightGreen,
                            size: 22.0,
                          ),
                        ),
                      ],
                    ),
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
