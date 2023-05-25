import 'package:busreservation/Data/database.dart';

import 'package:flutter/material.dart';

import '../Data/data.dart';
import '../Widgets/nav_bar.dart';
import '../Widgets/tickets.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

var ticketList = [];

DatabaseHelper db = DatabaseHelper.instance;
querryTickets() async {
  ticketList = await db.queryTickets(uid);
  return ticketList;
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('YOUR BOOKINGS'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        height: 800,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) => FutureBuilder(
                future: querryTickets(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else {
                    var ticketList = snapshot.data as List;
                    if (index < ticketList.length) {
                      return Tickets(
                          name: ticketList[index]['Name'],
                          busname: ticketList[index]['Busname'],
                          seatno: ticketList[index]['Seatno'],
                          date: ticketList[index]['Date']);
                    } else {
                      return Container();
                    }
                  }
                })),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
