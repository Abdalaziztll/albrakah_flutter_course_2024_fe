import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  // Widget offline =const  TestPage();
  // Widget offline2 =   const TestPage();
  // if (offline == offline2) {
  //   print("Matched");
  // } else {
  //   print("Not Matched");
  // }

  TestPageProMax temp = TestPageProMax();
  TestPageProMax temp1 = TestPageProMax();

  if (temp == temp1) {
    print("Matched");
  } else {
    print("Not Matched");
  }

  runApp(const App());
}

int counter = 0;
late double width;
late double height;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponivePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 4,
            child: Container(
              color: Colors.red,
              height: 300,
            ),
          ),
          Flexible(
            flex: 8,
            child: Container(
              color: Colors.blue,
              height: 300,
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              color: Colors.yellow,
              height: 300,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Flexible(
            flex: 8,
            child: Container(
              color: Colors.green,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}

class ThidPage extends StatelessWidget {
  const ThidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 400 && constraints.maxHeight > 800) {
            return Container(
              color: Colors.red,
            );
          } else {
            return Container(
              color: Colors.blue,
            );
          }
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: Icon(Icons.home)),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            counter++;
            print(counter);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class ResponivePage extends StatelessWidget {
  const ResponivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestPageProMax(),
                ));
          },
          child: Container(
            width: width * 0.5,
            height: height * 0.5,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

// class TestPage extends StatelessWidget {
//   const TestPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: InkWell(
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ResponivePage(),
//                 ));
//           },
//           child: Container(
//             child: Center(child: Text("Offline ")),
//             width: width * 0.5,
//             height: height * 0.5,
//             color: Colors.red,
//           ),
//         ),
//       ),
//     );
//   }
// }

class TestPageProMax extends StatelessWidget {
  TestPageProMax._Internal();

  static final ui = TestPageProMax._Internal();

  factory TestPageProMax() {
    return ui;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
