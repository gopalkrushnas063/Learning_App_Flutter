import 'package:flutter/material.dart';
import 'package:learning_app/screens/home/category_gridview.dart';
import 'package:learning_app/screens/home/courses_gridview.dart';
import 'package:learning_app/screens/home/custom_appbar.dart';


class HomePageSection extends StatelessWidget {
  const HomePageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
                right: 15,
              ),
              child: Column(
                children: [
                  CategoryGrid(),
                  CoursesGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}