// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  String title;
  num id;
  TodoModel({
    required this.title,
    required this.id,
  });

  TodoModel copyWith({
    String? title,
    num? id,
  }) {
    return TodoModel(
      title: title ?? this.title,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'] as String,
      id: map['id'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) => TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TodoModel(title: $title, id: $id)';

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.id == id;
  }

  @override
  int get hashCode => title.hashCode ^ id.hashCode;
}
