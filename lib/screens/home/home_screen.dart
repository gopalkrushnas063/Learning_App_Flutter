// import 'package:flutter/material.dart';
// import 'package:learning_app/screens/home/category_gridview.dart';
// import 'package:learning_app/screens/home/courses_gridview.dart';
// import 'package:learning_app/screens/home/custom_appbar.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });

//     switch (index) {
//       case 0:
//         // Do nothing, you are already on the home page.
//         break;
//       case 1:
//         Navigator.of(context).pushNamed('/course');
//         break;
//       case 2:
//         Navigator.of(context).pushNamed('/wishlist');
//         break;
//       case 3:
//         Navigator.of(context).pushNamed('/account');
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           CustomAppBar(),
//           SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.only(
//                 top: 20,
//                 left: 15,
//                 right: 15,
//               ),
//               child: Column(
//                 children: [
//                   CategoryGrid(),
//                   CoursesGrid(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: onTabTapped,
//         showUnselectedLabels: true,
//         iconSize: 32,
//         selectedItemColor: Colors.lightGreen,
//         selectedFontSize: 18,
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Courses'),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:learning_app/screens/account/account_section.dart';
import 'package:learning_app/screens/courses/all_courses_page.dart';
import 'package:learning_app/screens/home/home_page_view.dart';
import 'package:learning_app/screens/wishlist/wish_list_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      body: _pages[_currentIndex], // Display the current page based on index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Change the current index when a tab is tapped
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
