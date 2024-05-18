// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BookModel {
  String title;
  String author;
  num publication_year;
  String description;
  String cover_image;
  BookModel({
    required this.title,
    required this.author,
    required this.publication_year,
    required this.description,
    required this.cover_image,
  });

  BookModel copyWith({
    String? title,
    String? author,
    num? publication_year,
    String? description,
    String? cover_image,
  }) {
    return BookModel(
      title: title ?? this.title,
      author: author ?? this.author,
      publication_year: publication_year ?? this.publication_year,
      description: description ?? this.description,
      cover_image: cover_image ?? this.cover_image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'publication_year': publication_year,
      'description': description,
      'cover_image': cover_image,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'] as String,
      author: map['author'] as String,
      publication_year: map['publication_year'] as num,
      description: map['description'] as String,
      cover_image: map['cover_image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) => BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookModel(title: $title, author: $author, publication_year: $publication_year, description: $description, cover_image: $cover_image)';
  }

  @override
  bool operator ==(covariant BookModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.author == author &&
      other.publication_year == publication_year &&
      other.description == description &&
      other.cover_image == cover_image;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      author.hashCode ^
      publication_year.hashCode ^
      description.hashCode ^
      cover_image.hashCode;
  }
}
