import 'dart:async';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/theme/light_and_dark_theme.dart';
import 'package:learning_app/theme/provider/theme_provider.dart';

class CustomAppBar extends ConsumerStatefulWidget {
  const CustomAppBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  late final GlobalKey<ScaffoldState> scaffoldKey;
  int hintTextIndex = 0;
  late Timer _timer;
  List<String> hintTexts = [
    "Search Courses",
    "Search Books",
    "Search Classes",
    // Add more hint texts if needed
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        hintTextIndex = (hintTextIndex + 1) % hintTexts.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color baseColor = Color.fromARGB(255, 238, 250, 241);
    final isDarkMode = ref.watch(themeProvider) == darkTheme;

    return Container(
      padding: EdgeInsets.only(
        right: 15,
        left: 15,
      ),
      decoration: BoxDecoration(
        color:
            isDarkMode ? Color(0xFF161616) : Color.fromARGB(255, 238, 250, 241),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 3,
              bottom: 15,
            ),
            child: Text(
              "Hi Learner",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? Color(0xFFDCDCDC) : Colors.black,
              ),
            ),
          ),
          ClayContainer(
            borderRadius: 75,
            curveType: CurveType.none,
            width: MediaQuery.of(context).size.width,
            height: 55,
            color: isDarkMode ? Color(0xFF161616) : baseColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      size: 25,
                      color: isDarkMode
                          ? Color(0xFFDCDCDC)
                          : Colors.black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintTexts[hintTextIndex],
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? Color(0xFFDCDCDC)
                              : Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
