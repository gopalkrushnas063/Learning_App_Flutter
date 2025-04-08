import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Auth/controllers/auth.controller.dart';
import 'package:learning_app/features/Auth/views/login/login_screen.dart';
import 'package:learning_app/services/storage_service.dart';
import 'package:learning_app/theme/light_and_dark_theme.dart';
import 'package:learning_app/theme/provider/theme_provider.dart';

class ProfileSection extends ConsumerWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider) == darkTheme;
    Color baseColor = Color.fromARGB(255, 238, 250, 241);
    Future<void> logout() async {
      await ref
          .read(storageProvider)
          .delete(key: SecureStorageKeys.LOGIN_TOKEN.name);
    }

    return Scaffold(
      backgroundColor: theme == darkTheme ? Color(0xFF161616) : baseColor,
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: theme == darkTheme ? Color(0xFF161616) : baseColor,
        shadowColor: theme == darkTheme ? Color(0xFF161616) : baseColor,
        foregroundColor: theme == darkTheme ? Color(0xFF161616) : baseColor,
        surfaceTintColor: theme == darkTheme ? Color(0xFF161616) : baseColor,
        title: Column(
          children: [
            ClayContainer(
              color: theme == darkTheme ? Color(0xFF161616) : baseColor,
              height: 100,
              borderRadius: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/images/Python.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                "Gopal Krushna Sahoo",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Color(0xFFDCDCDC) : Colors.black),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ClayContainer(
        color: theme == darkTheme ? Color(0xFF161616) : baseColor,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              ...[
                _buildListItem(
                  icon: Icons.person,
                  title: "Profile",
                  subtitle: "Change/edit profile & address",
                  isDarkMode: isDarkMode,
                ),
                _buildListItem(
                  icon: Icons.assignment,
                  title: "Courses List",
                  subtitle: "Courses/materials & subsrciptions",
                  isDarkMode: isDarkMode,
                ),
                _buildListItem(
                  icon: Icons.emoji_events,
                  title: "Accomplishments",
                  subtitle: "Acomplishments, reward points",
                  isDarkMode: isDarkMode,
                ),
                // _buildListItem(
                //   icon: Icons.settings,
                //   title: "Settings",
                //   subtitle: "App settings",
                //   isDarkMode: isDarkMode,
                // ),
                // _buildListItem(
                //   icon: Icons.support,
                //   title: "Help Center",
                //   subtitle: "FAQ/ Customer Care Connect",
                //   isDarkMode: isDarkMode,
                // ),

                _buildDarkModeSwitch(
                  icon: Icons.contrast,
                  title: "Dark Mode",
                  subtitle: "Change app theme",
                  isDarkMode: isDarkMode,
                  ref: ref,
                ),
                GestureDetector(
                  onTap: () async {
                    await logout();
                    ref.invalidate(storageProvider);
                    ref.invalidate(authControllerProvider);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ClayContainer(
                      width: double.infinity,
                      height: 50,
                      color: theme == darkTheme ? Color(0xFF161616) : baseColor,
                      borderRadius: 30,
                      child: Center(
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            color: theme == darkTheme
                                ? Color(0xFFDCDCDC)
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ].expand((widget) => [widget, SizedBox(height: 25)]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isDarkMode,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ClayContainer(
        width: double.infinity,
        height: 60,
        color:
            isDarkMode ? Color(0xFF161616) : Color.fromARGB(255, 238, 250, 241),
        borderRadius: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 20),
            Container(
              width: 40,
              height: 40,
              child: Icon(
                icon,
                size: 30,
                color: isDarkMode ? Color(0xFFDCDCDC) : Colors.black,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isDarkMode ? Color(0xFFDCDCDC) : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: isDarkMode ? Color(0xFFDCDCDC) : Colors.black,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: isDarkMode ? Color(0xFFDCDCDC) : Colors.black,
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDarkModeSwitch({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isDarkMode,
    required WidgetRef ref,
  }) {
    final themeNotifier = ref.read(themeProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ClayContainer(
        width: double.infinity,
        height: 60,
        color:
            isDarkMode ? Color(0xFF161616) : Color.fromARGB(255, 238, 250, 241),
        borderRadius: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 20),
            Container(
              width: 40,
              height: 40,
              child: Icon(
                icon,
                size: 30,
                color: isDarkMode ? Color(0xFFDCDCDC) : Colors.black,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isDarkMode ? Color(0xFFDCDCDC) : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: isDarkMode ? Color(0xFFDCDCDC) : Colors.black,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: isDarkMode,
              onChanged: (val) {
                themeNotifier.toggleTheme();
              },
              activeTrackColor: Color(0xFF276EF1),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
