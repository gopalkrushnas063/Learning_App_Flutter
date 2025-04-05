import 'package:flutter/material.dart';
import 'package:learning_app/features/Home/widgets/category_gridview.dart';
import 'package:learning_app/features/Courses/views/courses.dart';
import 'package:learning_app/features/Home/widgets/custom_appbar.dart';
import 'package:learning_app/features/Home/widgets/banner_carousel.dart'
    as custom;

class HomePageSection extends StatelessWidget {
  const HomePageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 250, 241),
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Color.fromARGB(255, 238, 250, 241),
        shadowColor: Color.fromARGB(255, 238, 250, 241),
        foregroundColor: Color.fromARGB(255, 238, 250, 241),
        surfaceTintColor: Color.fromARGB(255, 238, 250, 241),
        title: CustomAppBar(),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                custom.CarouselView(),
                SizedBox(
                  height: 20,
                ),
                CategoryGrid(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Courses(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
