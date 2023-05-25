import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Data/data.dart';

import '../Providers/provider.dart';

class Seats extends StatefulWidget {
  const Seats({super.key, required this.seatno});
  final int seatno;

  @override
  State<Seats> createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SeatProvider>(
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          counter = value.count();
          if (counter < 4 || value.tempBooked[widget.seatno - 1] != 0) {
            setState(() {
              if (value.tempBooked[widget.seatno - 1] == 0) {
                value.tempBooked[widget.seatno - 1] = widget.seatno;
              } else {
                value.tempBooked[widget.seatno - 1] = 0;
              }
            });
            bill = price * (counter + 1);
          }
        },
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            value.tempBooked[widget.seatno - 1] == 0
                ? 'lib/assets/unbooked.png'
                : 'lib/assets/selected.png',
            height: 45,
          ),
          Text(
            widget.seatno.toString(),
          )
        ]),
      ),
    );
  }
}
