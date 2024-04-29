import 'dart:convert';

import 'package:dio/dio.dart';

String token = '';
login({required User user}) async {
  Dio dio = Dio();
  Response response = await dio.post(
      "https://food-api-omega.vercel.app/api/v1/chef/signin",
      data: user.toMap());
  if (response.statusCode == 202) {
    token = response.data['token'];
  }
  print(response);
}

getData() async {
  Dio dio = Dio();
  Response response = await dio.get(
    "https://food-api-omega.vercel.app/api/v1/chef/get-chef/66166877047e0824bcaa3368/meals",
    // options: Options(
    //   headers: {
    //     "token":"FOODAPI ${token}"
    //   }
    // )
  );

  List<Meal> meals = List.generate(response.data['meals'].length,
      (index) => Meal.fromMap(response.data['meals'][index]));

  print(meals);
}

class Meal {
  String name;
  num price;
  Meal({
    required this.name,
    required this.price,
  });

  Meal copyWith({
    String? name,
    num? price,
  }) {
    return Meal(
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

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      name: map['name'] as String,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) =>
      Meal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Meal(name: $name, price: $price)';

  @override
  bool operator ==(covariant Meal other) {
    if (identical(this, other)) return true;

    return other.name == name && other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}

class User {
  String email;
  String password;
  User({
    required this.email,
    required this.password,
  });

  User copyWith({
    String? email,
    String? password,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(email: $email, password: $password)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
