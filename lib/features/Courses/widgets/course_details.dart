import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/theme/light_and_dark_theme.dart';
import 'package:learning_app/theme/provider/theme_provider.dart';
import 'package:learning_app/widgets/description_section.dart';
import 'package:learning_app/widgets/material_section.dart';

class CourseDetails extends ConsumerStatefulWidget {
  final String img;
  CourseDetails(this.img);

  @override
  ConsumerState<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends ConsumerState<CourseDetails> {
  bool isVideoSection = true;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider) == darkTheme;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: isDarkMode ? Color(0xFF161616) : Colors.black,
        backgroundColor: isDarkMode ? Color(0xFF161616) : Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.img,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              size: 28,
              color: Colors.lightGreen,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isDarkMode ? Color(0xFF161616) : Color(0xFFF5F3FF),
                image: DecorationImage(
                    image: AssetImage('assets/images/${widget.img}.png')),
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Color(0xFF161616) : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.lightGreen,
                    size: 45,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              '${widget.img} Complete Course',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Created by Gopal Krishna',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? Color(0xFFDCDCDC)
                    : Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 5),
            Text(
              '55 Materials',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? Color(0xFFDCDCDC)
                    : Colors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: isDarkMode ? Color(0xFF161616) : Color(0xFFF5F3FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    color: isVideoSection
                        ? Colors.lightGreen
                        : Colors.lightGreen.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isVideoSection = true;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                        child: Text(
                          'Materials',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: isVideoSection
                        ? Colors.lightGreen.withOpacity(0.5)
                        : Colors.lightGreen,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isVideoSection = false;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            isVideoSection ? VideoSection() : DescriptionSection(),
          ],
        ),
      ),
    );
  }
}
