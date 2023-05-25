import 'package:busreservation/Data/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data/data.dart';
import '../Providers/provider.dart';
import '../Widgets/nav_bar.dart';

import 'final_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

DatabaseHelper db = DatabaseHelper.instance;
insertTicket(row) {
  db.insert(row, DatabaseHelper.bookings);
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SeatProvider>(
        builder: (context, provider, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.red,
                title: const Text('PAYMENT'),
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
                                          i < provider.tempBooked.length;
                                          i++) {
                                        provider.tempBooked[i] = 0;
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
                                        provider.passengers[i]['Name'] = '';
                                        provider.passengers[i]['Age'] = '';
                                        provider.passengers[i]['Gender'] = '';
                                        provider.passengers[i]['Date'] = '';
                                        provider.passengers[i]['Busname'] = '';
                                        provider.passengers[i]['Seatno'] = 0;
                                        provider.passengers[i]['Status'] =
                                            false;
                                        provider.passengers[i]['Id'] = 0;
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
                children: [
                  const SizedBox(
                    height: 100,
                    child: Center(
                        child: Icon(
                      Icons.verified,
                      size: 80,
                      color: Colors.green,
                    )),
                  ),
                  const SizedBox(
                    height: 50,
                    child: Center(
                        child: Text(
                      'THANKYOU FOR BOOKING',
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                  SizedBox(
                    height: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.currency_rupee_sharp,
                          size: 50,
                        ),
                        Text(
                          bill.toString(),
                          style: const TextStyle(fontSize: 70),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.grey,
                    indent: 35,
                    endIndent: 35,
                  ),
                  SizedBox(
                    height: 340,
                    child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          if (provider.passengers[index]['Seatno'] != 0) {
                            return ListTile(
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 0.5),
                                    borderRadius: BorderRadius.circular(150)),
                                child: Center(
                                  child: Text(
                                    provider.passengers[index]['Seatno']
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              title: Text(
                                  'Name : ${provider.passengers[index]["Name"]}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              subtitle: Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                            'Age : ${provider.passengers[index]["Age"]}',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                        Text(
                                            'Gender : ${provider.passengers[index]["Gender"]}',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      child: Text(
                                          'Date : ${provider.passengers[index]["Date"]}',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    )
                                  ],
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(25, 0, 25, 15),
                            );
                          }
                        }),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.grey,
                    indent: 35,
                    endIndent: 35,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(1, 20, 0, 0),
                    child: Row(children: [
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
                                                  i <
                                                      provider
                                                          .tempBooked.length;
                                                  i++) {
                                                provider.tempBooked[i] = 0;
                                              }
                                              busName = '';
                                              price = 0;
                                              counter = 0;
                                              bill = 0;
                                              for (var i = 0;
                                                  i < forms.length;
                                                  i++) {
                                                forms[i]['name'] = '';
                                                forms[i]['age'] = 0;
                                                forms[i]['gender'] = '';
                                                dateNow = 'Date';
                                                forms[i]['date'] = '';
                                                provider.passengers[i]['Name'] =
                                                    '';
                                                provider.passengers[i]['Age'] =
                                                    '';
                                                provider.passengers[i]
                                                    ['Gender'] = '';
                                                provider.passengers[i]['Date'] =
                                                    '';
                                                provider.passengers[i]
                                                    ['Busname'] = '';
                                                provider.passengers[i]
                                                    ['Seatno'] = 0;
                                                provider.passengers[i]
                                                    ['Status'] = false;
                                                provider.passengers[i]['Id'] =
                                                    0;
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
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Text(
                              'Cancel',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
                            )),
                          )),
                      GestureDetector(
                          onTap: () {
                            for (var i = 0;
                                i < provider.passengers.length;
                                i++) {
                              if (provider.passengers[i]['Seatno'] != 0) {
                                insertTicket(provider.passengers[i]);
                              }
                            }
                            setState(() {
                              text = 'Thanks for booking\n\nSHUBH YATRAA !!!!!';
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const FinalPage())));
                          },
                          child: Container(
                            height: 50,
                            width: 190,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Text(
                              'Confirm',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            )),
                          ))
                    ]),
                  )
                ],
              ),
              bottomNavigationBar: const Navbar(),
            ));
  }
}
