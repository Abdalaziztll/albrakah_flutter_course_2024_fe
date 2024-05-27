import 'package:dio/dio.dart';
import 'package:quiz_app_ui_with_mockapi/model/quiz_model.dart';

abstract class QuizService {
  Dio dio = Dio();
  late Response response;
  String baseurl = "https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/quiz";

  Future<bool> createNewQuiz(QuizModel quiz);

  Future<List<QuizModel>> getAllQuiz();
}

class QuizServiceImp extends QuizService {
  @override
  Future<bool> createNewQuiz(QuizModel quiz) async {
    try {
      response = await dio.post(baseurl, data: quiz.toMap());
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print(e.message);
      return false;
    }
  }

  @override
  Future<List<QuizModel>> getAllQuiz() {
    // TODO: impxlement getAllQuiz
    throw UnimplementedError();
  }
}
