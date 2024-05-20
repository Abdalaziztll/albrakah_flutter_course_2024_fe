import 'package:coffe_shop_trainning/res/app_style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageOfLazaApp(),
    );
  }
}

class CoffeShopStartPage extends StatelessWidget {
  const CoffeShopStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 9,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
            Spacer(
              flex: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 312,
                height: 50,
                child: Center(
                  child: Text(
                    "Start",
                    style: TextStyle(color: Color(0xffEDDBC5)),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff230C02)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 312,
                height: 50,
                child: Center(
                  child: Text(
                    "Start",
                    style: TextStyle(color: Color(0xff230C02)),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff230C02)),
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xffEDDBC5)),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              "Forget Your Password",
              style: TextStyle(color: Color(0xff230C02), fontSize: 14),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/cup_of_coffe_ba.png').image,
                fit: BoxFit.cover)),
      ),
    );
  }
}

class HomePageofCoffeShop extends StatelessWidget {
  const HomePageofCoffeShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEDDBC5),
        leading: Icon(Icons.search),
        title: Text("Good Day , Hello"),
        actions: [
          Badge(
            child: Icon(
              Icons.notification_add,
            ),
          ),
          Icon(
            Icons.menu,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            width: double.maxFinite,
            height: 60,
            color: Color(0xffEDDBC5),
            child: Text(
              "What would you like to\n drink today",
              style: TextStyle(fontSize: 14, color: Color(0xff230C02)),
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.all(16),
            color: Color(0xffEDDBC5),
            width: double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:
                          (index == 0) ? Color(0xff230C02) : Color(0xffEDDBC5),
                      borderRadius: BorderRadius.circular(25)),
                  width: 60,
                  height: 24,
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color:
                          (index != 0) ? Color(0xff230C02) : Color(0xffEDDBC5),
                    ),
                  )),
            ),
          ),
          Flexible(
            child: Container(
              color: Color(0xff230C02),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hello',
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff230C02)),
                              ),
                              Text(
                                'Hello Wolrd',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff230C02)),
                              )
                            ],
                          ),
                          Spacer(
                            flex: 4,
                          ),
                          Container(
                              height: 75,
                              width: 75,
                              child: Image.asset('assets/cup_of_coffe_ba.png'))
                        ],
                      ),
                      width: 330,
                      height: 104,
                      decoration: BoxDecoration(
                          color: Color(0xffEDDBC5),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomePageOfLazaApp extends StatelessWidget {
  const HomePageOfLazaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.maxFinite,
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(Icons.arrow_back),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(Icons.shop),
                )
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset(
              'assets/img.png',
              fit: BoxFit.fitWidth,
            ).image)),
          )),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Men's Printed Pullover Hoodie",
                        style: baseSecondaryStyle,
                      ),
                      Text(
                        "Price",
                        style: baseSecondaryStyle,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nike Club Fleece",
                      style: baseStyle,
                    ),
                    Text(
                      "49321",
                      style: baseStyle,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/man_back_shirt.png'),
                    Image.asset('assets/man_back_shirt.png'),
                    Image.asset('assets/man_back_shirt.png'),
                    Image.asset('assets/man_back_shirt.png'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text("Hello"), Text("World")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    sizes.length,
                    (index) => Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade400),
                      child: Center(
                        child: Text(
                          sizes[index],
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Hello Hello Wolrd"),
                  subtitle: Text(
                      "Aliquip id officia ex dolore velit. Anim laborum adipisicing quis consectetur labore elit non ullamco et ut labore est excepteur. Et sunt cupidatat voluptate reprehenderit aliquip consectetur incididunt do ex ea. Dolore incididunt amet veniam do ipsum nulla ut consectetur ex commodo in nulla. Do ut excepteur id enim voluptate enim deserunt laboris Lorem sit nisi esse est eu. Consectetur ad commodo velit tempor amet qui."),
                )
              ],
            ),
          ),
          Container(
            height: 70,
            color: Colors.purple,
            child: Center(
              child: Text(
                "Add to List",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<String> sizes = ["S", "M", "L", "XL", "XXl"];


