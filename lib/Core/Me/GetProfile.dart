import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixty_days_chat/Core/Me/Profile.dart';

class GetProfile{
  static Future<bool> profile()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.get('userId').toString();
    String authToken = prefs.get('authToken').toString();
    var headers = {
      'X-Auth-Token': authToken,
      'X-User-Id': userId,
    };
    final response = await http.get(
        Uri.parse('https://open.rocket.chat/api/v1/me'),
        headers: headers
    ).timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      Future sharedWriteValue(String key , String value) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(key, value);
      }
      ProfileData profileData = ProfileData.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      sharedWriteValue('name', profileData.name);
      sharedWriteValue('username', profileData.username);
      sharedWriteValue('avatar', profileData.avatarUrl);
      return true;
    }
    else {
      print(response.statusCode);
      print(response.body);
      return false;
    }
  }

}