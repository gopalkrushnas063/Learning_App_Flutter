import 'package:flutter/material.dart';
import 'package:learning_app/features/Profile/views/profile_section.dart';
import 'package:learning_app/features/Courses/widgets/all_courses_page.dart';
import 'package:learning_app/features/Main/views/main_screen.dart';
import 'package:learning_app/features/Wishlist/wish_list_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/course':
        return MaterialPageRoute(builder: (_) => AllCourseList());

      case '/wishlist':
        return MaterialPageRoute(builder: (_) => WishList());
      case '/account':
        return MaterialPageRoute(builder: (_) => ProfileSection());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Text('Error: Unknown Route'),
          ),
        );
      },
    );
  }
}
