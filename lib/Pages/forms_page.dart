import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Data/data.dart';
import '../Providers/provider.dart';
import '../Widgets/form.dart';
import '../Widgets/nav_bar.dart';

import 'payment_page.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  @override
  Widget build(BuildContext context) {
    var keyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    int i = 0;
    int j = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('DETAILS'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<SeatProvider>(
        builder: (context, provider, child) => SizedBox(
          height: 900,
          child: Column(children: [
            const SizedBox(
              height: 60,
              child: Center(
                child: Text('Fill the passenger\'s details',
                    style: TextStyle(fontSize: 22)),
              ),
            ),
            SizedBox(
              height: keyBoard ? 360 : 580,
              child: ListView.builder(
                itemCount: 32,
                itemBuilder: (context, index) {
                  if (provider.tempBooked[index] != 0) {
                    i++;
                    return Forms(
                      passNo: i,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            keyBoard
                ? Container()
                : Row(children: [
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
                                                i < provider.tempBooked.length;
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
                                              forms[i]['date'] = '';
                                              provider.passengers[i]['Name'] =
                                                  '';
                                              provider.passengers[i]['Age'] =
                                                  '';
                                              provider.passengers[i]['Gender'] =
                                                  '';
                                              provider.passengers[i]['Date'] =
                                                  '';
                                              provider.passengers[i]
                                                  ['Busname'] = '';
                                              provider.passengers[i]['Seatno'] =
                                                  0;
                                              provider.passengers[i]['Status'] =
                                                  false;
                                              provider.passengers[i]['Id'] = 0;
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
                          margin: const EdgeInsets.only(top: 20, right: 5),
                          height: 50,
                          width: 190,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 192, 54, 44),
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          )),
                        )),
                    GestureDetector(
                        onTap: () {
                          for (var i = 0; i < provider.tempBooked.length; i++) {
                            if (provider.tempBooked[i] != 0) {
                              provider.passengers[j]['Name'] = forms[j]['name'];
                              provider.passengers[j]['Gender'] =
                                  forms[j]['gender'];
                              provider.passengers[j]['Age'] = forms[j]['age'];
                              provider.passengers[j]['Date'] = dateNow;
                              provider.passengers[j]['Busname'] = busName;
                              provider.passengers[j]['Status'] = true;
                              provider.passengers[j]['Seatno'] =
                                  provider.tempBooked[i];
                              provider.passengers[j]['Id'] = uid;
                              j++;
                            }
                          }

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentPage()));
                        },
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20, left: 5),
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
                          ),
                        ))
                  ])
          ]),
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
