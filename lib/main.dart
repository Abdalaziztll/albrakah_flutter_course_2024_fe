import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stateless_ui/model/quiz_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizPage(),
    );
  }
}

TextEditingController username = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // itemExtent: 400,
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: username,
              onChanged: (value) {
                // print(username.text);
              },
              decoration: InputDecoration(
                  // ? fill color is realated to filled named parametar
                  // filled: true,
                  // fillColor: Colors.grey,
                  hintText: "Email",
                  // helperText: "UserName",
                  // prefix: Icon(Icons.search),
                  prefixIcon: Icon(Icons.search),
                  // labelText: "UserName",
                  // icon: FlutterLogo(),
                  // label: FlutterLogo(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          ListTile(
            // ! hover colors is realated to ontap
            hoverColor: Colors.red,
            onTap: () {
              print(username.text);
            },

            // ? show functionalaty in statefull widget
            // enabled: false,
            // selected: true,
            // mouseCursor: SystemMouseCursors.help,

            title: const Text("Hello World"),
            subtitle: const Text(
                "Laboris dolor labore do laboris do commodo sit laborum aute sint ex."),
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            trailing: const Icon(Icons.search),
          ),
          Divider(
            color: Colors.pink.shade100,
            indent: 10,
            endIndent: 20,
            // thickness: 3,
          ),
          Dismissible(
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                print("Hello wolrd");
              } else {
                print("No Hello");
              }
            },
            background: Container(
              color: Colors.green,
            ),
            movementDuration: const Duration(seconds: 3),

            // ? to Make dissmiss in one direction
            // direction: DismissDirection.endToStart,
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete),
              color: Colors.red,
            ),
            key: GlobalKey(),
            child: const ListTile(
              title: Text("Hello World"),
              subtitle: Text(
                  "Laboris dolor labore do laboris do commodo sit laborum aute sint ex."),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.search),
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          if (username.text == "Hello") {
            // ? ...nextPage()
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                dismissDirection: DismissDirection.horizontal,
                showCloseIcon: true,
                behavior: SnackBarBehavior.floating,
                action: SnackBarAction(label: 'active', onPressed: () {}),
                backgroundColor: Colors.red,
                content: Text("names[index],"),
              ),
            );
          }
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

List<String> names = [
  "Lama",
  "Eanas",
  "Doaaa",
  "Bayan",
  "Aya",
  "Yasmen",
  "Noor",
  "Reem",
  "Qamar",
  "Arowa",
  "Ranem",
  "Noor",
  "Ola",
  "Ghalia",
  "Esraa",
  "Abdalaziz"
];

class DynamicUIFromModel extends StatelessWidget {
  const DynamicUIFromModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        // physics: BouncingScrollPhysics(),
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  dismissDirection: DismissDirection.horizontal,
                  showCloseIcon: true,
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(label: 'active', onPressed: () {}),
                  backgroundColor: Colors.green,
                  content: Text(
                    names[index],
                  ),
                ),
              );
            },
            leading: CircleAvatar(
              child: Text((index + 1).toString()),
            ),
            title: Text(
              names[index],
            ),
          );
        },
      ),
    );
  }
}

List<QuizModel> quizModel = [
  QuizModel(
      question: "How Long Are You ?",
      answers: ["190", "170", "130", "160", "100"],
      indexOfCorrectAnswer: 2),
  QuizModel(
      question: "How Old Are You ?",
      answers: ["19", "17", "13", "16"],
      indexOfCorrectAnswer: 1),
  QuizModel(
      question: "How Much Cost to did you pay ?",
      answers: ["190 \$", "170 \$", "130 \$", "000 \$", "100 \$"],
      indexOfCorrectAnswer: 3)
];

PageController pageController = PageController();

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: quizModel.length,
        itemBuilder: (context, ind) {
          return Scaffold(
            body: Column(
              children: [
                ListTile(
                  tileColor: Colors.grey,
                  title: Text(quizModel[ind].question),
                ),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: quizModel[ind].answers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          if (index == quizModel[ind].indexOfCorrectAnswer) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.green,
                                content: Text(
                                  "Correct Answer!!!!",
                                ),
                              ),
                            );
                            pageController.nextPage(
                                duration: Duration(seconds: 2),
                                curve: Curves.bounceInOut);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red,
                                content: Text("Sorry , This is Wrong Answer"),
                              ),
                            );
                          }
                        },
                        subtitle: Text(quizModel[ind].answers[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
