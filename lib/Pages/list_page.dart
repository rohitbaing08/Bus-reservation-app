import 'package:busreservation/Data/data.dart';
import 'package:flutter/material.dart';
import '../Widgets/bus_list.dart';
import '../Widgets/nav_bar.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('BUSES LIST'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
          itemCount: busList.length,
          itemBuilder: (context, index) {
            return BusList(
                busNo: busList[index]["busNo"],
                name: busList[index]["busName"],
                source: busList[index]['source'],
                destination: busList[index]['destination'],
                time: busList[index]['time'],
                price: busList[index]['price']);
          }),
      bottomNavigationBar: const Navbar(),
    );
  }
}
