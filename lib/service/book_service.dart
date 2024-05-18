import 'package:dio/dio.dart';
import 'package:statfull_and_builder/model/book_model.dart';

Future<BookModel> getBookData() async {
  Dio req = Dio();
  Response response = await req.get("https://freetestapi.com/api/v1/books/1");
  print(response);
  BookModel book = BookModel.fromMap(response.data);
  return book;
}
