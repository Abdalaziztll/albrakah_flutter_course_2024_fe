import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: GridView(
        
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // mainAxisExtent: 50,
            childAspectRatio: 1 / 1,
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            Container(
              // height: 1000,
              color: Colors.red,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ));
  }
}
