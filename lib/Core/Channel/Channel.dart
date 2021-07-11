import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Channel {
  static Future<bool> sendMassage(String massage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.get('userId').toString();
    String authToken = prefs.get('authToken').toString();
    var headers = {
      'X-Auth-Token': authToken,
      'X-User-Id': userId,
    };
    final response = await http
        .post(Uri.parse('https://open.rocket.chat/api/v1/me'),
            headers: headers,
            body: json.encode({
              "message": {"rid": "kd7Mcsu9A4wSqkaNi", "msg": massage}
            }))
        .timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.statusCode);
      print(response.body);
      return false;
    }
  }
}
