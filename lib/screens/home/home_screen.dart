import 'package:flutter/material.dart';
import 'package:learning_app/screens/account/account_section.dart';
import 'package:learning_app/screens/courses/all_courses_page.dart';
import 'package:learning_app/screens/home/home_page_view.dart';
import 'package:learning_app/screens/wishlist/wish_list_screen.dart';

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
    AccountSection(),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.lightGreen,
        toolbarHeight: 60,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications,color: Colors.white,),
            onPressed: () {
              // Handle the notification icon click here.
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Menu Item 1'),
              onTap: () {
                // Handle menu item 1 click here.
              },
            ),
            ListTile(
              title: Text('Menu Item 2'),
              onTap: () {
                // Handle menu item 2 click here.
              },
            ),
            // Add more menu items as needed.
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showUnselectedLabels: true,
        iconSize: 32,
        selectedItemColor: Colors.lightGreen,
        selectedFontSize: 18,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
