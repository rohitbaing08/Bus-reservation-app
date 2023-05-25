import 'package:flutter/material.dart';

import '../Data/data.dart';
import '../Pages/about_page.dart';
import '../Pages/bookings_page.dart';
import '../Pages/buses_page.dart';
import '../Pages/home_page.dart';
import '../Pages/login_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(255, 246, 193, 193),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 70),
            height: 140,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'lib/assets/OIP.jpeg',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Hey $email',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const HomePage())));
            },
            child: const ListTile(
              contentPadding: EdgeInsets.fromLTRB(10, 35, 10, 15),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const BusesPage())));
            },
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey))),
              child: const ListTile(
                contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                title: Text(
                  'Book Tickets',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const BookingsPage())));
            },
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey))),
              child: const ListTile(
                contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                title: Text(
                  'Booking History',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const AboutPage())));
            },
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey))),
              child: const ListTile(
                contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                title: Text(
                  'About Us',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const LoginPage())));
            },
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey))),
              child: const ListTile(
                contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                title: Text(
                  'Login/Register',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          )
        ]),
      );
  }
}