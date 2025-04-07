import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/theme/light_and_dark_theme.dart';
import 'package:learning_app/theme/provider/theme_provider.dart';

class DescriptionSection extends ConsumerWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider) == darkTheme;

    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            "E-learning is a digital educational approach that utilizes internet-based technologies to deliver educational content and facilitate learning. It offers flexibility, accessibility, and a wide range of multimedia resources for learners, making it a popular choice for remote and self-paced education.",
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode
                  ? Color(0xFFDCDCDC)
                  : Colors.black.withOpacity(0.7),
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Course Length: ",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.timer,
                color: Colors.lightGreen,
              ),
              SizedBox(width: 5),
              Text(
                "26 Hours",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(width: 5),
              Text(
                "4.5",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
