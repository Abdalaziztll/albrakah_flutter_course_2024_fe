// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

main() async {
  await getHttp();
  await getListOfData();
}

Dio dio = Dio();

getHttp() async {
  Response response =
      await dio.get("https://jsonplaceholder.typicode.com/todos/1");
  if (response.statusCode == 200) {
    // Todos todo = Todos(
    //     userId: response.data['userId'],
    //     id: response.data['id'],
    //     title: response.data['title'],
    //     completed: response.data['completed']);
    Todos todo = Todos.fromMap(response.data);
    print(todo);
  } else {
    print("there is no connection");
  }
}

getListOfData() async {
  Response response =
      await dio.get("https://jsonplaceholder.typicode.com/todos");
  if (response.statusCode == 200) {
    // ! convert List of Map to List of Object
    // List<dynamic> temp = response.data;
    // List<Todos> todos = [];
    // for (var element in temp) {
    //   var data = Todos.fromMap(element);
    //   todos.add(data);
    // }
    // print(todos);

    // ! convert List of Map to List of Object
    List<Todos> test = List.generate(
      response.data.length,
      (index) => Todos.fromMap(
        response.data[index],
      ),
    );

    print(test);
  } else {
    print("there is no connection");
  }
}

class Todos {
  int userId;
  int id;
  String title;
  bool completed;
  Todos({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  Todos copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return Todos(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory Todos.fromMap(Map<String, dynamic> map) {
    return Todos(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todos.fromJson(String source) =>
      Todos.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todos(userId: $userId, id: $id, title: $title, completed: $completed)';
  }
}
