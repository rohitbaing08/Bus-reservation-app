import 'package:busreservation/Data/database.dart';
import 'package:busreservation/main.dart';
import 'package:flutter/material.dart';
import '../Data/data.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DatabaseHelper db = DatabaseHelper.instance;
  insertUser(Map<String, dynamic> row) async {
    return await db.insert(row, DatabaseHelper.users);
  }

  @override
  Widget build(BuildContext context) {
    var keyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('LOGIN / SIGNUP'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: 40.0, bottom: keyBoard ? 30 : 150.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Register',
              style: TextStyle(fontSize: keyBoard ? 30.0 : 50.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  keyBoard ? '' : 'Lets get',
                  style: TextStyle(fontSize: keyBoard ? 0 : 25.0),
                ),
                Text(
                  keyBoard ? '' : 'you on board',
                  style: TextStyle(fontSize: keyBoard ? 0 : 25.0),
                ),
              ],
            ),
            Column(
              children: [
                TextField(
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                uid = DateTime.now().millisecondsSinceEpoch.toInt();
                var row = {'Userid': uid, 'Email': email, 'Password': password};
                insertUser(row);
                setState(() {
                  isLogin = true;
                });
                Navigator.popAndPushNamed(context, '/home');
              },
              child: const Text(
                'Register',
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 60.0,
                    color: Colors.black87,
                  ),
                ),
                const Text(
                  'Or',
                  style: TextStyle(fontSize: 25.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 60.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 15.0),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/login');
                  },
                  child: const Text(
                    ' Sign In',
                    style: TextStyle(fontSize: 22.0, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
