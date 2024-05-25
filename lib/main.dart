import 'package:flutter/material.dart';
import 'package:get_it_and_benefit/config/get_it_config.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: core.get<HomePage>());
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  GlobalKey<FormState> formstatelogin = GlobalKey();
  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // autovalidateMode:AutovalidateMode.always ,
        key: formstatelogin,
        child: Column(
          children: [
            TextFormField(
              controller: username,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "the field is empty please enter your username";
                }
                if (value!.length < 5) {
                  return "the length should be greater than 5";
                }
              },
            ),
            TextFormField(
              controller: email,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "the field is empty please enter your username";
                }
                if (value!.length > 5) {
                  return "the length should be greater than 5";
                }
              },
            ),
            InkWell(
              child: Icon(Icons.abc_outlined),
              onTap: () {
                if (formstatelogin.currentState!.validate()) {
                  print(username.text + " " + email.text);
                } else {
                  print("object");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class HomePageWithDate extends StatelessWidget {
  const HomePageWithDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageWithAnoutherData(),
                  ));
            },
            child: Text(core.get<DateTime>().second.toString())),
      ),
    );
  }
}

class HomePageWithAnoutherData extends StatelessWidget {
  const HomePageWithAnoutherData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(core.get<DateTime>().second.toString()),
      ),
    );
  }
}
