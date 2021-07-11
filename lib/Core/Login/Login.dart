import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixty_days_chat/Core/Login/loginResponse.dart';

class Login{
  static Future<bool> login(username,password)async{

    final response = await http.post(
        Uri.parse('https://open.rocket.chat/api/v1/login'),
        body: {
          'username': username,
          'password': password
        }
    ).timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      Future sharedWriteValue(String key , String value) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(key, value);
      }
      loginUserResponse loginData = loginUserResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      sharedWriteValue('isLogin', "true");
      sharedWriteValue('userId', loginData.userId);
      sharedWriteValue('authToken', loginData.authToken);
      return true;
    }
    else {
      return false;
    }
  }
}