import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_app/myhome_page.dart';
import 'package:learning_app/screens/account/account_section.dart';
import 'package:learning_app/screens/courses/all_courses_page.dart';
import 'package:learning_app/screens/home/home_page_view.dart';
import 'package:learning_app/screens/wishlist/wish_list_screen.dart';
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
    AccountSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 238, 250, 241),
        toolbarHeight: 60,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle the notification icon click here.
            },
          ),
        ],
      ),
      drawer: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.lightGreen,
        ),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                ),
                accountName: Center(
                  child: Text(
                    "Krishna Tech World",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                accountEmail: Text(
                  "If we teach today as we \n taught yesterday,we rob our children of tomorrow.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                iconColor: Colors.lightGreen,
                title: Text('Profile Section ̀'),
                onTap: () {
                  // Handle menu item 1 click here.
                },
              ),
              ListTile(
                leading: Icon(Icons.newspaper),
                iconColor: Colors.lightGreen,
                title: Text('Courses List'),
                onTap: () {
                  // Handle menu item 2 click here.
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                iconColor: Colors.lightGreen,
                title: Text('Share App'),
                onTap: () {
                  // Handle menu item 2 click here.
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                iconColor: Colors.lightGreen,
                title: Text('My Home Page'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
              ),
              // Add more menu items as needed.
            ],
          ),
        ),
      ),
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
