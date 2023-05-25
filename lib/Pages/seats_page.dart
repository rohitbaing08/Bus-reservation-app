import 'package:busreservation/Data/database.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Data/data.dart';
import '../Providers/provider.dart';
import '../Widgets/disabled_seats.dart';
import '../Widgets/nav_bar.dart';
import '../Widgets/seats.dart';
import 'forms_page.dart';

class SeatsPage extends StatefulWidget {
  const SeatsPage({super.key});

  @override
  State<SeatsPage> createState() => _SeatsPageState();
}

class _SeatsPageState extends State<SeatsPage> {
  final db = DatabaseHelper.instance;
  var booked = [];

  querySeats(int seatno, String busName) async {
    var booked = await db.querySeats(seatno, busName, dateNow);
    return booked;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeatProvider>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.red,
                title: const Text('BOOKING'),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                                'Do you want to cancel the transaction??'),
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
                                    setState(() {
                                      for (var i = 0;
                                          i < value.tempBooked.length;
                                          i++) {
                                        value.tempBooked[i] = 0;
                                      }
                                      busName = '';
                                      price = 0;
                                      counter = 0;
                                      dateNow = 'Date';
                                      bill = 0;
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
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(fontSize: 18),
                                  ))
                            ],
                          );
                        });
                  },
                ),
              ),
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                      child: Center(
                        child: Text('Select the Seats (Max 4)',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 3),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              const Text('Available')
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 136, 255, 0),
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              const Text('Selected')
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 3),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              const Text('Booked')
                            ],
                          )
                        ],
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.92,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 570,
                            width: 142,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: 16,
                                itemBuilder: (context, i) {
                                  return FutureBuilder(
                                      future: querySeats(i + 1, busName),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Container();
                                        } else {
                                          var list = snapshot.data as List;

                                          return Container(
                                            child: list.isEmpty
                                                ? Seats(seatno: i + 1)
                                                : DisableSeats(seatno: i + 1),
                                          );
                                        }
                                      });
                                }),
                          ),
                          const SizedBox(
                            width: 77,
                          ),
                          SizedBox(
                            height: 570,
                            width: 142,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: 16,
                                itemBuilder: (context, i) {
                                  return FutureBuilder(
                                      future: querySeats(i + 17, busName),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Container();
                                        } else {
                                          var list = snapshot.data as List;
                                          return Container(
                                            child: list.isEmpty
                                                ? Seats(seatno: i + 17)
                                                : DisableSeats(seatno: i + 17),
                                          );
                                        }
                                      });
                                }),
                          ),
                        ],
                      ),
                    ),
                    Row(children: [
                      GestureDetector(
                          onTap: () {
                            showCupertinoDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                        'Do you want to cancel the transaction??'),
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
                                            setState(() {
                                              for (var i = 0;
                                                  i < value.tempBooked.length;
                                                  i++) {
                                                value.tempBooked[i] = 0;
                                              }
                                              busName = '';
                                              price = 0;
                                              counter = 0;
                                              dateNow = 'Date';
                                              bill = 0;
                                              for (var i = 0;
                                                  i < forms.length;
                                                  i++) {
                                                forms[i]['name'] = '';
                                                forms[i]['age'] = 0;
                                                forms[i]['gender'] = '';
                                                forms[i]['date'] = '';
                                                value.passengers[i]['Name'] =
                                                    '';
                                                value.passengers[i]['Age'] = '';
                                                value.passengers[i]['Gender'] =
                                                    '';
                                                value.passengers[i]['Date'] =
                                                    '';
                                                value.passengers[i]['Busname'] =
                                                    '';
                                                value.passengers[i]['Seatno'] =
                                                    0;
                                                value.passengers[i]['Status'] =
                                                    false;
                                                value.passengers[i]['Id'] = 0;
                                              }
                                            });
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/home',
                                                (route) => false);
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(fontSize: 18),
                                          ))
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 50,
                            width: 190,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 192, 54, 44),
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Text(
                              'Cancel',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            )),
                          )),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const FormsPage())));
                          },
                          child: Container(
                            height: 50,
                            width: 190,
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Text(
                              'Done',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            )),
                          ))
                    ])
                  ]),
              bottomNavigationBar: const Navbar(),
            ));
  }
}
