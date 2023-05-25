import 'package:busreservation/Data/database.dart';
import 'package:flutter/material.dart';
import '../Data/data.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var message = '';

  var result = [];

  DatabaseHelper db = DatabaseHelper.instance;
  queryPassword(String emailid) async {
    var result = await db.queryEmail(emailid);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var keyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('LOGIN / SIGNUP'),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: 50.0,
              bottom: keyBoard ? 30 : 150.0,
              left: 20.0,
              right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: keyBoard ? 30.0 : 50.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    keyBoard ? '' : 'Welcome back,',
                    style: TextStyle(fontSize: keyBoard ? 0 : 25.0),
                  ),
                  Text(
                    keyBoard ? '' : 'please login',
                    style: TextStyle(fontSize: keyBoard ? 0 : 25.0),
                  ),
                ],
              ),
              Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      message,
                      style: const TextStyle(fontSize: 18.0, color: Colors.red),
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                future: queryPassword(email),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                    );
                  } else {
                    return ElevatedButton(
                      onPressed: () {
                        var list = snapshot.data as List;
                        if (list.isEmpty) {
                          setState(() {
                            message = 'Email doesn`t exists';
                          });
                        } else if (list[1]['Password'] == password) {
                          setState(() {
                            message = '';
                          });
                          uid = list[1]['UserId'];
                          setState(() {
                            isLogin = true;
                          });
                          Navigator.popAndPushNamed(context, '/home');
                        } else {
                          setState(() {
                            message = 'Incorrect Password';
                          });
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                    );
                  }
                },
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
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/register');
                    },
                    child: const Text(
                      ' Sign Up',
                      style: TextStyle(fontSize: 22.0, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
