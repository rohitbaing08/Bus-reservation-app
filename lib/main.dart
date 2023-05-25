import 'package:busreservation/Pages/about_page.dart';

import 'package:busreservation/Pages/buses_page.dart';

import 'package:busreservation/Pages/home_page.dart';
import 'package:busreservation/Pages/list_page.dart';
import 'package:busreservation/Pages/login_page.dart';
import 'package:busreservation/Pages/bookings_page.dart';
import 'package:busreservation/Pages/payment_page.dart';
import 'package:busreservation/Pages/profile_page.dart';
import 'package:busreservation/Pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Pages/seats_page.dart';
import 'Pages/final_page.dart';
import 'Providers/provider.dart';

void main() {
  runApp(const MyApp());
}

bool isLogin=false;
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => SeatProvider()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:isLogin? const HomePage():const LoginPage(),

        theme: ThemeData(primarySwatch: Colors.red),
        routes: {
          '/home': (context) => const HomePage(),
          '/about': (context) => const AboutPage(),
          '/display': (context) => const BusesPage(),
          '/booking': (context) =>const SeatsPage(),
          '/order': (context) => const BookingsPage(),
          '/profile': (context) => const ProfilePage(),
          '/final':(context) => const FinalPage(),
          '/list':(context) => const ListPage(),
          '/payment':(context) => const PaymentPage(),
          '/login':(context) => const LoginPage(),
          '/register':(context) => const RegisterPage()

        },
      ),
    );
  }
}
