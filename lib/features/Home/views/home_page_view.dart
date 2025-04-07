import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/features/Home/widgets/category_gridview.dart';
import 'package:learning_app/features/Courses/views/courses.dart';
import 'package:learning_app/features/Home/widgets/custom_appbar.dart';
import 'package:learning_app/features/Home/widgets/banner_carousel.dart'
    as custom;
import 'package:learning_app/theme/light_and_dark_theme.dart';
import 'package:learning_app/theme/provider/theme_provider.dart';

class HomePageSection extends ConsumerWidget {
  const HomePageSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider) == darkTheme;
    return Scaffold(
      backgroundColor: isDarkMode
          ? Color(0xFF161616)
          : Color.fromARGB(255, 238, 250, 241),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 130,
        backgroundColor: isDarkMode
            ? Color(0xFF161616)
            : Color.fromARGB(255, 238, 250, 241),
        shadowColor: isDarkMode
            ? Color(0xFF161616)
            : Color.fromARGB(255, 238, 250, 241),
        foregroundColor: isDarkMode
            ? Color(0xFF161616)
            : Color.fromARGB(255, 238, 250, 241),
        surfaceTintColor: isDarkMode
            ? Color(0xFF161616)
            : Color.fromARGB(255, 238, 250, 241),
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
