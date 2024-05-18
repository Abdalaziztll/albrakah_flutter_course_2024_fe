import 'package:flutter/material.dart';
import 'package:statfull_and_builder/model/book_model.dart';
import 'package:statfull_and_builder/service/book_service.dart';
import 'package:statfull_and_builder/view/home_page_with_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: HomePageWithNotifingApi(),
    );
  }
}
