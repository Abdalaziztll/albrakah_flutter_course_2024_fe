import 'package:dio/dio.dart';
import 'package:full_app_with_mockapi_and_search/core/config/get_it_config.dart';
import 'package:full_app_with_mockapi_and_search/model/user_login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService {
  Dio req = Dio();
  late Response response;
  String baseurl = "https://dummyjson.com/auth/login";

  Future<bool> logIn(UserLoginModel user);
}

class AuthSeviceImp extends AuthService {
  @override
  Future<bool> logIn(UserLoginModel user) async {
    try {
      response = await req.post(baseurl, data: user.toMap());
      if (response.statusCode == 200) {
        core
            .get<SharedPreferences>()
            .setString('token', response.data['token']);
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print(e.message);
      return false;
    }
  }
}
