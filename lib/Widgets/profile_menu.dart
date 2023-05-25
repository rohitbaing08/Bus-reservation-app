import 'package:flutter/material.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu(
      {super.key, required this.icon, required this.text, required this.press});
  final String text;
  final VoidCallback? press;
  final IconData? icon;
  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color.fromARGB(255, 214, 216, 223),
        ),
        onPressed: widget.press,
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: Colors.black,
              size: 22,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(widget.text)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
