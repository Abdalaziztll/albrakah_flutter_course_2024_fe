import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:statfull_and_builder/model/book_model.dart';
import 'package:statfull_and_builder/service/book_service.dart';
import 'package:statfull_and_builder/view/home_page_example.dart';
import 'package:statfull_and_builder/view/home_page_with_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double counter = 0;
  bool isChecked = false;
  bool isNewChecked = false;

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePageWithNotifing(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // counter = 20;
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              setState(() {
                counter = counter + 0.1;
              });
              print(counter);
            },
            child: Icon(Icons.add)),
      ),
      body: Center(
          child: ListView(
        children: [
          CheckboxListTile(
              selectedTileColor: Colors.green,
              selected: isChecked,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text("Non et consectetur laboris in."),
              value: isChecked,
              onChanged: (val) {
                setState(() {
                  isChecked = val!;
                });
              }),
          SizedBox(
            width: 100,
            height: 100,
            child: FittedBox(
              child: Checkbox(
                value: isNewChecked,
                onChanged: (value) {
                  setState(() {
                    isNewChecked = value!;
                  });
                },
              ),
            ),
          ),
          CircularProgressIndicator(
            strokeWidth: 10,

            // !
            // strokeAlign: -1,
            color: Colors.red,
            value: counter,
          )
        ],
      )),
    );
  }
}
