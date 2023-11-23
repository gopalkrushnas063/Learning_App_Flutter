import 'package:flutter/material.dart';

class VideoSection extends StatefulWidget {
  @override
  _VideoSectionState createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  List videoList = [
    'Introduction to Flutter',
    'Installing Flutter on Windows',
    'Setup Emulator on Windows',
    'Creating Our First App'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? Colors.lightGreen
                  : Colors.lightGreen.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: Container(
              width: 30,
              height: 30,
              child: Icon(
                Icons.file_copy,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          title: Text(
            videoList[index],
          ),
          subtitle: Text("20 min 50 sec"),
        );
      },
    );
  }
}
