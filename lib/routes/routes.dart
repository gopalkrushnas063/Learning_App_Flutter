import 'package:flutter/material.dart';
import 'package:learning_app/screens/account/account_section.dart';
import 'package:learning_app/screens/courses/all_courses_page.dart';
import 'package:learning_app/screens/home/home_screen.dart';
import 'package:learning_app/screens/wishlist/wish_list_screen.dart';

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
        return MaterialPageRoute(builder: (_) => AccountSection());
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
