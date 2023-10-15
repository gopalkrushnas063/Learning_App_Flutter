import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {

  //Creating static data in lists
  List catNames = [
    'Category',
    'Classes',
    'Courses',
    'E-Book Store',
    'Live Courses',
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
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.assignment, color: Colors.white, size: 30),
    Icon(Icons.store, color: Colors.white, size: 30),
    Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    Icon(Icons.emoji_events, color: Colors.white, size: 30),
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
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: catColors[index],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: catIcons[index],
              ),
            ),
            SizedBox(height: 10),
            Text(
              catNames[index],
              style: TextStyle(
                fontSize: 16,
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
