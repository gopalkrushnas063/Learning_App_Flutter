import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {

  //Creating static data in lists
  List catNames = [
    'All Exams',
    'Daily Practices',
    'Mock Test',
    'Question Papers',
    'Why Choose Us',
    'Leader Board'
  ];

  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF618DFD),
    Color(0xFFFC7F7F),
    Color(0xFFC084FB),
    Color(0xFF78E667),
  ];

  List<Icon> catIcons = [
    Icon(Icons.all_inbox, color: Color(0xFFFFCF2F), size: 30),
    Icon(Icons.question_answer, color: Color(0xFF6FE08D), size: 30),
    Icon(Icons.assignment, color: Color(0xFF618DFD), size: 30),
    Icon(Icons.question_answer_outlined, color: Color(0xFFFC7F7F), size: 30),
    Icon(Icons.question_mark, color: Color(0xFFC084FB), size: 30),
    Icon(Icons.emoji_events, color: Color(0xFF78E667), size: 30),
  ];


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: catNames.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
      ),
      
      itemBuilder: (context, index) {
        return Column(
          
          children: [
            ClayContainer(
              height: 60,
              width: 60,
              borderRadius:50,
              color: Color.fromARGB(255, 238, 250, 241),
              curveType: CurveType.concave,
              child: Center(
                child: catIcons[index],
              ),
            ),
            SizedBox(height: 10),
            Text(
              catNames[index],
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ],
        );
      },
    );
  }
}
