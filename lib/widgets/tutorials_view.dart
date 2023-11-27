import 'package:flutter/material.dart';


class TutorialsView extends StatelessWidget {
  final String videoTitle;

  TutorialsView(this.videoTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(videoTitle),
      ),
      body: Center(
        child: Text('PDF View for $videoTitle'),
      ),
    );
  }
}
