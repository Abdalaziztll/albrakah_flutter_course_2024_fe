// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserLoginModel {
  String email;
  String password;
  UserLoginModel({
    required this.email,
    required this.password,
  });

  UserLoginModel copyWith({
    String? email,
    String? password,
  }) {
    return UserLoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': email,
      'password': password,
    };
  }

  factory UserLoginModel.fromMap(Map<String, dynamic> map) {
    return UserLoginModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginModel.fromJson(String source) => UserLoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserLoginModel(email: $email, password: $password)';

  @override
  bool operator ==(covariant UserLoginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
