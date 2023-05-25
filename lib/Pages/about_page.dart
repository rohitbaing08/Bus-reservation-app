import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('ABOUT'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  'ABOUT US',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              )),
          const SizedBox(
              height: 200,
              width: 330,
              child: Text(
                'Do you want to know the best way to book tickets online securely and how to book tickets in advance? ShubhYatraa.com is the best online platform for bus booking, train tickets booking and hotels booking. You can check the amenities provided, compare booking fares, check bus timings in the searched route, other facilities and more with us. You can find an affordable and cost-effective online travel bookings facility at ShubhYatraa.',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              )),
          const SizedBox(
              height: 250,
              width: 330,
              child: Center(
                child: Text(
                  'With ShubhYatraa, online bus ticket booking is now very easy. You simply need to fill in the details of your journey in our search bar (departure city, destination city and the date of journey) click on the search button to get all the bus operators available for booking tickets online. Then, select the bus that best suits your travel needs and securely complete your booking online on ShubhYatraa.com.We would recommend that you book your tickets at least 2 - 3 days in advance so that you can reserve bus or train seats as per your preference and get the best-discounted price on your booking.',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              )),
          const SizedBox(
            height: 70,
            child: Center(
              child: Text(
                'CONTACT US',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
              width: 330,
              child: Row(
                children: const [
                  Text(
                    'Email :',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '\tShubhYatraa123@email.com',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
