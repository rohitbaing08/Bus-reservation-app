import 'package:flutter/material.dart';

import '../Data/data.dart';

class Forms extends StatefulWidget {
  const Forms({super.key, required this.passNo});
  final int passNo;
  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: 0.92,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Passenger ${widget.passNo}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.92,
          child: TextFormField(
            validator: (value) {
              if (value == null) {
                return '*Required';
              }
            },
            onChanged: (value) {
              forms[widget.passNo - 1]['name'] = value;
            },
            cursorColor: Colors.grey,
            cursorHeight: 25,
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.start,
                  color: Colors.black,
                ),
                hintText: 'Enter name',
                label: Text(
                  'Name',
                  style: TextStyle(color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                )),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FractionallySizedBox(
          widthFactor: 0.92,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return '*Required';
                    }
                  },
                  onChanged: (value) {
                    forms[widget.passNo - 1]['age'] = value;
                  },
                  cursorColor: Colors.grey,
                  cursorHeight: 25,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.start,
                        color: Colors.black,
                      ),
                      hintText: 'Enter age',
                      label: Text(
                        'Age',
                        style: TextStyle(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      )),
                ),
              ),
              SizedBox(
                width: 150,
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return '*Required';
                    }
                  },
                  onChanged: (value) {
                    forms[widget.passNo - 1]['gender'] = value;
                  },
                  cursorColor: Colors.grey,
                  cursorHeight: 25,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.start,
                        color: Colors.black,
                      ),
                      hintText: 'Enter gender',
                      label: Text(
                        'Gender',
                        style: TextStyle(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      )),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
