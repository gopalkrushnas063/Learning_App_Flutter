import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart'; // Add this import
import 'package:learning_app/features/Jobs/views/jobs_screen.dart';
import 'package:learning_app/features/Profile/views/profile_section.dart';
import 'package:learning_app/features/Courses/widgets/all_courses_page.dart';
import 'package:learning_app/features/Home/views/home_page_view.dart';
import 'package:learning_app/features/Wishlist/wish_list_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePageSection(),
    JobsScreen(),
    // AllCourseList(),
    // WishList(),
    ProfileSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.white, // Background color of the navigation bar
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 30),
          child: GNav(
            rippleColor: Colors.grey[300]!, // Ripple effect color
            hoverColor: Colors.grey[100]!, // Hover effect color
            gap: 8, // Gap between icon and text
            activeColor: Colors.lightGreen, // Active icon/text color
            iconSize: 24, // Icon size
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 12), // Button padding
            duration: Duration(milliseconds: 400), // Animation duration
            tabBackgroundColor:
                Colors.lightGreen.withOpacity(0.1), // Active tab background
            color: Colors.grey[600], // Inactive icon/text color
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.work,
                text: 'Jobs',
              ),
              // GButton(
              //   icon: Icons.assignment,
              //   text: 'Courses',
              // ),
              // GButton(
              //   icon: Icons.favorite,
              //   text: 'Wishlist',
              // ),
              GButton(
                icon: Icons.person,
                text: 'Account',
              ),
            ],
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
