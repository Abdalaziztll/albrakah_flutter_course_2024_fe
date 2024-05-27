import 'package:flutter/material.dart';
import 'package:quiz_app_ui_with_mockapi/model/quiz_model.dart';
import 'package:quiz_app_ui_with_mockapi/service/quiz_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreateQuiz(),
    );
  }
}

class CreateQuiz extends StatelessWidget {
  CreateQuiz({super.key});

  TextEditingController question = TextEditingController();
  TextEditingController answer = TextEditingController();
  TextEditingController answer1 = TextEditingController();
  TextEditingController answer2 = TextEditingController();
  TextEditingController answer3 = TextEditingController();
  TextEditingController indexOfCorrect = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
              child: TextField(
                controller: question,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
              child: TextField(
                controller: answer,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
              child: TextField(
                controller: answer1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
              child: TextField(
                controller: answer2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
              child: TextField(
                controller: answer3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
              child: TextField(
                controller: indexOfCorrect,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
          onTap: () async {
            bool status = await QuizServiceImp().createNewQuiz(QuizModel(
                question: question.text,
                answers: [
                  answer.text,
                  answer1.text,
                  answer2.text,
                  answer3.text
                ],
                indexOfCorrect: num.parse(indexOfCorrect.text)));

            if (status) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Success"),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Error"),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ));
            }
          },
          child: Icon(Icons.send)),
    );
  }
}
