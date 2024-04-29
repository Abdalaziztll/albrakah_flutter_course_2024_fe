// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'jwt_token.dart';

main() async {
 
  await login(
      user: User(
          email: "flutter.test99test@gmail.com",
          password: "fluttertest99test@"));


  // await updateData(id: '3', book: BookModel(name: "Hello", price: 0));
  // await getListData();
  // await deleteDate(id: '3');
  // await createData(book: BookModel(name: "name", price: 1000));
  // await deleteDate(id: '4');
  // await getOneData(id: '1');
}

class BookModel {
  String name;
  num price;
  BookModel({
    required this.name,
    required this.price,
  });

  BookModel copyWith({
    String? name,
    num? price,
  }) {
    return BookModel(
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      name: map['name'] as String,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BookModel(name: $name, price: $price)';

  @override
  bool operator ==(covariant BookModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}

Dio dio = Dio();
late Response response;
String baseUrl = "https://662f69f643b6a7dce30f67d5.mockapi.io/book";

getListData() async {
  response = await dio.get(baseUrl);
  print(response);
}

getOneData({String id = '1'}) async {
  response = await dio.get(baseUrl + '/' + id);
  print(response);
}

createData({required BookModel book}) async {
  response = await dio.post(baseUrl, data: book.toMap());
  print(response);
}

updateData({required String id, required BookModel book}) async {
  response = await dio.put(baseUrl + '/' + id, data: book.toMap());
  print(response);
}

deleteDate({required String id}) async {
  response = await dio.delete(baseUrl + '/' + id);
  print(response);
}
