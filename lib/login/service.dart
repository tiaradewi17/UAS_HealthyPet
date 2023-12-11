import 'package:dio/dio.dart';
import 'user.dart';

class APIServices {
  static Future<List<User>> fetchUser() async {
    Response response = await Dio().get("https://reqres.in/api/users");
    List<User> users =
        (response.data['data'] as List).map((v) => User.fromJson(v)).toList();
    return users;
  }
}
