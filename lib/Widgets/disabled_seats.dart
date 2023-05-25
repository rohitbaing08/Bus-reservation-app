import 'package:flutter/material.dart';

class DisableSeats extends StatelessWidget {
  const DisableSeats({super.key, required this.seatno});
  final int seatno;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'lib/assets/booked.png',
        height: 45,
      ),
      Text(
        seatno.toString(),
      )
    ]);
  }
}
