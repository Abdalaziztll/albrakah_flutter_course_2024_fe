import 'package:flutter/material.dart';
import 'package:statfull_and_builder/model/book_model.dart';
import 'package:statfull_and_builder/service/book_service.dart';

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

class HomePageWithFutureApi extends StatelessWidget {
  const HomePageWithFutureApi({super.key});

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
              future: getBookData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.network(snapshot.data!.cover_image),
                    ),
                    title: Text(snapshot.data!.title),
                    subtitle: Text(snapshot.data!.description),
                    trailing: Text(snapshot.data!.publication_year.toString()),
                  );
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

class HomePageWithNotifingApi extends StatelessWidget {
  HomePageWithNotifingApi({super.key});
  ValueNotifier<BookModel?> counter = ValueNotifier(null);
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
                return hisValue == null
                    ? CircularProgressIndicator()
                    : Text(hisValue!.title);
              },
            )
          ],
        ),
      ),
      floatingActionButton: InkWell(
          onTap: () async {
            var data = await getBookData();
            counter.value = data;
          },
          child: Icon(Icons.add)),
    );
  }
}
