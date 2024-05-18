
import 'package:flutter/material.dart';

class HomePageWithNotifing extends StatelessWidget {
  HomePageWithNotifing({super.key});
  ValueNotifier<int> counter = ValueNotifier(0);
  // int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 215, 129, 158),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("The counter is : "),
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (context, hisValue, _) {
                return Text(hisValue.toString());
              },
            )
          ],
        ),
      ),
      floatingActionButton: InkWell(
          onTap: () {
            counter.value++;
            print(counter.value);
          },
          child: Icon(Icons.add)),
    );
  }
}

class HomePageWithFuture extends StatelessWidget {
  const HomePageWithFuture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 215, 129, 158),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("The counter is : "),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<int> getData() async {
  await Future.delayed(Duration(seconds: 4));

  return 4;
}
