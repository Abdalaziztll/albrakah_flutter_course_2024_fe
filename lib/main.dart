// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            actions: [
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
            ],
            centerTitle: false,
            title: Text('Hello World'),
            backgroundColor: Colors.green),
        body: Container(
          // width: 1000,
          color: Colors.red,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(

                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.only(top: 14),
                  decoration: BoxDecoration(
                    
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    // borderRadius: const BorderRadius.only(
                    //   topLeft: Radius.circular(15),
                    //   bottomRight: Radius.circular(15),
                    // ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.green,
                      ],
                    ),
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  width: 100,
                  height: 100,
                  child: const Center(child: Text("data")),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.only(top: 14),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    // borderRadius: const BorderRadius.only(
                    //   topLeft: Radius.circular(15),
                    //   bottomRight: Radius.circular(15),
                    // ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.green,
                      ],
                    ),
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  width: 100,
                  height: 100,
                  child: const Center(child: Text("data")),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.only(top: 14),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    // borderRadius: const BorderRadius.only(
                    //   topLeft: Radius.circular(15),
                    //   bottomRight: Radius.circular(15),
                    // ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.green,
                      ],
                    ),
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  width: 100,
                  height: 100,
                  child: const Center(child: Text("data")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
