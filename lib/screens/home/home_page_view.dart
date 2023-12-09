import 'package:flutter/material.dart';
import 'package:learning_app/screens/home/category_gridview.dart';
import 'package:learning_app/screens/courses/courses_gridview.dart';
import 'package:learning_app/screens/home/custom_appbar.dart';
import 'package:learning_app/views/banner_carousel.dart';


class HomePageSection extends StatelessWidget {
  const HomePageSection({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 250, 241),
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
                  CarouselView(),
                  SizedBox(height: 20,),
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