import 'package:botttom_nav_bar_and_some_widget/model/todo_model.dart';
import 'package:botttom_nav_bar_and_some_widget/pages_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  
  runApp(SimplePage());
}


class SimplePage extends StatelessWidget {
  const SimplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TabExample(),
                      ));
                },
                child: Icon(Icons.add))
          ],
        ),
        body: pages[index],

        // bottomNavigationBar: BottomNavigationBar(
        //     currentIndex: index,
        //     onTap: (value) {
        //       setState(() {
        //         index = value;
        //       });
        //     },
        //     items: [
        //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'hello'),
        //       BottomNavigationBarItem(icon: Icon(Icons.add), label: 'hello'),
        //       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'hello'),
        //     ]),
        // ? Material 3 Design
        bottomNavigationBar: NavigationBar(
            // indicatorColor: Colors.red,

            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: Duration(seconds: 4),
            selectedIndex: index,
            onDestinationSelected: (value) {
              setState(() {
                index = value;
              });
            },
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
                selectedIcon: Icon(Icons.facebook),
              ),
              NavigationDestination(icon: Icon(Icons.add), label: 'Second'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Details')
            ]));
  }
}

// TabBar + Controller + TabView

class TabExample extends StatelessWidget {
  const TabExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: Builder(
          builder: (context) {
            return InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(Icons.draw_rounded));
          },
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    child: FlutterLogo(),
                  ),
                  accountName: Text("Hello Wolrd"),
                  accountEmail: Text("Hello Wolrd@gmail.com")),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.settings),
                title: Text("Setting"),
              ),
              Spacer(),
              ListTile(
                title: Text(
                  "LogOut",
                  style: TextStyle(color: Colors.red),
                ),
                trailing: Icon(Icons.logout),
              )
            ],
          ),
        ),
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          backgroundColor: Colors.purple.shade200,
          title: Text("Hello Wolrd"),
          bottom: TabBar(tabs: [
            Tab(
              text: 'First',
            ),
            Tab(
              text: 'Second',
            ),
            Tab(
              text: 'Third',
            )
          ]),
        ),
        body: TabBarView(children: [
          Container(
            child: Center(
              child: InkWell(
                  onTap: () async {
                    await getData();
                  },
                  child: Text("Press Me")),
            ),
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
        ]),
      ),
    );
  }
}

Future<List<TodoModel>> getData() async {
  Dio req = Dio();
  List<TodoModel> todos = [];
  try {
    Response res = await req.get("https://jsonplaceholder.typicode.com/todos");
    for (var i = 0; i < res.data.length; i++) {
      TodoModel todo = TodoModel.fromMap(res.data[i]);
      todos.add(todo);
    }
    return todos;
  } catch (e) {
    print(e);
    return todos;
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  // separatorBuilder: (context, index) => Divider(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    // ? Eng.Qamar
                    return Card(
                        child:
                            ListTile(title: Text(snapshot.data![index].title)));
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

// ? ReOrderableListView : Eng.Doaa
// ? ListWheelScrollView : Eng.Aya
// ? level_map : Eng.Ola 
// ? TextFormField : Eng.Reem