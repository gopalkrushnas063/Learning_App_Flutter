import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({Key? key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = Colors.lightGreen;
    return ClayContainer(
      color: baseColor,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClayContainer(
              color: baseColor,
              height: 250,
              width: 100,
              borderRadius: 60, // Half of the height to make it a circle
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  "assets/images/Python.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          ),
          SizedBox(height: 15),
          Center(
            child: ClayText(
              "Gopal Krushna Sahoo",
              color: baseColor,
              textColor: baseColor,
              size: 35,
            ),
          ),
          SizedBox(height: 15),
          ...[
            _buildListItem(
              icon: Icons.person,
              title: "Profile",
              subtitle: "Change/edit profile & address",
            ),
            _buildListItem(
              icon: Icons.assignment,
              title: "Courses List",
              subtitle: "Change/edit profile & address",
            ),
            _buildListItem(
              icon: Icons.emoji_events,
              title: "Accomplishments",
              subtitle: "Change/edit profile & address",
            ),
            _buildListItem(
              icon: Icons.settings,
              title: "Settings",
              subtitle: "Change/edit profile & address",
            ),
            _buildListItem(
              icon: Icons.support,
              title: "Help Center",
              subtitle: "Change/edit profile & address",
            ),
            SizedBox(height: 25),
            ClayContainer(
              width: 100,
              height: 50,
              color: baseColor,
              borderRadius: 30,
              child: Center(
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ].expand((widget) => [widget, SizedBox(height: 25)]),
        ],
      ),
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ClayContainer(
      width: 340,
      height: 60,
      color: Colors.lightGreen,
      borderRadius: 30,
      child: Row(
        children: [
          SizedBox(width: 20),
          Container(
            width: 20,
            height: 20,
            child: Icon(
              icon,
              size: 25,
            ),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(width: 95),
          Icon(
            Icons.arrow_forward_ios,
            size: 30,
          ),
        ],
      ),
    );
  }
}
