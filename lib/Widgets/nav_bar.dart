import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/home');
            },
            icon: const Icon(Icons.home, size: 30, color: Colors.black)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/order');
            },
            icon: const Icon(Icons.airplane_ticket_outlined,
                size: 30, color: Colors.black)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            icon: const Icon(Icons.info, size: 30, color: Colors.black)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(Icons.person, size: 30, color: Colors.black))
      ]),
    );
  }
}
