import 'package:flutter/material.dart';
import 'package:learning_app/features/Home/widgets/category_gridview.dart';
import 'package:learning_app/features/Courses/views/courses.dart';
import 'package:learning_app/features/Home/widgets/custom_appbar.dart';
import 'package:learning_app/features/Home/widgets/banner_carousel.dart' as custom;

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
                  custom.CarouselView(),
                  SizedBox(
                    height: 20,
                  ),
                  CategoryGrid(),
                  Courses(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
