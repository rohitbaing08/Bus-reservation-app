import 'package:flutter/material.dart';

import '../Data/data.dart';
import '../Pages/bookings_page.dart';

class Tickets extends StatefulWidget {
  const Tickets(
      {super.key,
      required this.name,
      required this.busname,
      required this.seatno,
      required this.date});
  final String busname;
  final String name;
  final String date;
  final int seatno;

  @override
  State<Tickets> createState() => _TicketsState();
}

deleteTicket(ticketdate, ticketName) async {
  return await db.delete(uid, ticketdate, ticketName);
}

class _TicketsState extends State<Tickets> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(26),
              margin: const EdgeInsets.fromLTRB(26, 26, 26, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                  )
                ],
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.busname,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'PASSENGER :',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                widget.name,
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 28),
                              const Text(
                                'DATE :',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                widget.date,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'SEATNO ',
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 28),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 0.5),
                                    borderRadius: BorderRadius.circular(150)),
                                child: Center(
                                  child: Text(
                                    widget.seatno.toString(),
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: const Text('Are you sure??'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'No',
                                        style: TextStyle(fontSize: 18),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        deleteTicket(widget.date, widget.name);
                                        Navigator.pop(context);
                                        Navigator.popAndPushNamed(
                                            context, '/order');
                                      },
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(fontSize: 18),
                                      )),
                                ]);
                          });
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
