import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Data/data.dart';
import '../Providers/provider.dart';
import '../Widgets/nav_bar.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: const Text(''),
      ),
      body: Stack(children: [
        const Center(
            child: Text(
          'Your booking is sucessful\nSHUBH YATRA!!',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        )),
        Consumer<SeatProvider>(
          builder: (context, value, child) => GestureDetector(
            onTap: () {
              setState(() {
                for (var i = 0; i < value.tempBooked.length; i++) {
                  value.tempBooked[i] = 0;
                }
                busName = '';
                price = 0;
                counter = 0;
                bill = 0;
                dateNow = 'Date';
                for (var i = 0; i < forms.length; i++) {
                  forms[i]['name'] = '';
                  forms[i]['age'] = 0;
                  forms[i]['gender'] = '';
                  forms[i]['date'] = '';
                  value.passengers[i]['Name'] = '';
                  value.passengers[i]['Age'] = '';
                  value.passengers[i]['Gender'] = '';
                  value.passengers[i]['Date'] = '';
                  value.passengers[i]['Busname'] = '';
                  value.passengers[i]['Seatno'] = 0;
                  value.passengers[i]['Status'] = false;
                  value.passengers[i]['Id'] = 0;
                }
              });
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(40, 550, 40, 80),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: const Center(
                  child: Text(
                'BACK TO HOME',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: const Navbar(),
    );
  }
}
