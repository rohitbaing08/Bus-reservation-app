import 'package:busreservation/main.dart';
import 'package:flutter/material.dart';
import '../Data/data.dart';
import '../Widgets/nav_bar.dart';
import '../Widgets/profile_menu.dart';
import '../Widgets/profile_pic.dart';

class ProfilePage extends StatefulWidget {
  static String routeName = "/profile";

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('PROFILE'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: Icons.account_box,
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: Icons.logout,
              press: () {
                setState(() {
                  isLogin = false;
                  email = '';
                  password = '';
                  uid = 0;
                });
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
