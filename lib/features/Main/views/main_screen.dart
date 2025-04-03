import 'package:flutter/material.dart';
import 'package:learning_app/features/Profile/views/profile_section.dart';
import 'package:learning_app/features/Courses/widgets/all_courses_page.dart';
import 'package:learning_app/features/Home/views/home_page_view.dart';
import 'package:learning_app/features/Wishlist/wish_list_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePageSection(),
    AllCourseList(),
    WishList(),
    ProfileSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.lightGreen,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.assignment, title: 'Courses'),
          TabItem(icon: Icons.favorite, title: 'Wishlist'),
          TabItem(icon: Icons.person, title: 'Account'),
        ],
        onTap: (int index) {
          // Implement your logic here based on the tapped index
          setState(() {
            _currentIndex =
                index; // Assuming _currentIndex is a variable in your State
          });

          // You can add additional logic here based on the tapped index
          switch (index) {
            case 0:
              // Logic for Home tab
              break;
            case 1:
              // Logic for Discovery tab
              break;
            case 2:
              // Logic for Add tab
              break;
            // Add more cases for additional tabs if needed
          }
        },
        initialActiveIndex: _currentIndex, // Set initial active index
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (int index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   showUnselectedLabels: true,
      //   iconSize: 32,
      //   selectedItemColor: Colors.lightGreen,
      //   selectedFontSize: 18,
      //   unselectedItemColor: Colors.grey,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Courses'),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      //   ],
      // ),
    );
  }
}
