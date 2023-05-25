import 'package:busreservation/Widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../Data/data.dart';
import '../Widgets/nav_bar.dart';
import 'about_page.dart';
import 'buses_page.dart';
import 'list_page.dart';
import 'login_page.dart';
import 'bookings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fieldText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 231, 252),
      appBar: AppBar(
        title: const Text(
          'ShubhYatraa',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      drawer: const CustomDrawer(),
      body: Stack(children: [
        ListView(children: [
          Container(
            // margin: const EdgeInsets.only(top: 20),
            height: 350,
            // width: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/Bus-icon.png'),
                  fit: BoxFit.fill),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const BusesPage())));
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(40, 70, 40, 40),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: const Center(
                  child: Text(
                'BOOK NOW',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const BookingsPage())));
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(40, 30, 40, 40),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: const Center(
                  child: Text(
                'CANCEL TICKETS',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const ListPage())));
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(40, 30, 40, 60),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: const Center(
                  child: Text(
                'BUSES LIST',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
              color: Color.fromARGB(150, 251, 252, 231),
            ),
            child: Column(
              children: [
                Container(
                  width: 370,
                  margin: const EdgeInsets.only(top: 10, bottom: 5),
                  child: const Text(
                    'Latest Offers',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                    width: 370,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: const Text(
                      'Get best deals with great discounts and offers',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 13),
                    )),
                Container(
                  margin: const EdgeInsets.only(left: 5, bottom: 10),
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        height: 150,
                        width: 260,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        height: 150,
                        width: 260,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        height: 150,
                        width: 260,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        height: 150,
                        width: 260,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        height: 150,
                        width: 260,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ]),
      bottomNavigationBar: const Navbar(),
    );
  }
}
