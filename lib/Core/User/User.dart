import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixty_days_chat/Core/Me/Profile.dart';

class User{
  static Future<String> getAvatar(String gestUserId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.get('userId').toString();
    String authToken = prefs.get('authToken').toString();
    var headers = {
      'X-Auth-Token': authToken,
      'X-User-Id': userId,
    };
    final response = await http.get(
        Uri.parse('https://open.rocket.chat/api/v1/users.getAvatar?userId=$gestUserId'),
        headers: headers
    ).timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }else{
      return "false";
    }
  }

}