import 'package:flutter/cupertino.dart';

class SeatProvider extends ChangeNotifier {
  List<Map<String, dynamic>> passengers = [
    {
      "Name": '',
      "Age": 0,
      "Gender": '',
      "Date": '',
      "Busname": '',
      'Seatno': 0,
      'Status': false,
      'Id': 0
    },
    {
      "Name": '',
      "Age": 0,
      "Gender": '',
      "Date": '',
      "Busname": '',
      'Seatno': 0,
      'Status': false,
      'Id': 0
    },
    {
      "Name": '',
      "Age": 0,
      "Gender": '',
      "Date": '',
      "Busname": '',
      'Seatno': 0,
      'Status': false,
      'Id': 0
    },
    {
      "Name": '',
      "Age": 0,
      "Gender": '',
      "Date": '',
      "Busname": '',
      'Seatno': 0,
      'Status': false,
      'Id': 0
    }
  ];

  int count() {
    var counter = 0;
    for (var i = 0; i < tempBooked.length; i++) {
      if (tempBooked[i] != 0) {
        counter = counter + 1;
      }
    }
    return counter;
  }

  var tempBooked = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
}
