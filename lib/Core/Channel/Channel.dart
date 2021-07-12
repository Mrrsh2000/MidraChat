import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixty_days_chat/Core/Channel/Messages.dart';

class Channel {
  static Future<bool> sendMassage(String massage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.get('userId').toString();
    String authToken = prefs.get('authToken').toString();
    var headers = {
      'X-Auth-Token': authToken,
      'X-User-Id': userId,
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse('https://open.rocket.chat/api/v1/chat.sendMessage'));
    request.body = json.encode({
      "message": {
        "rid": "kd7Mcsu9A4wSqkaNi",
        "msg": massage
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send().timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      return false;
    }
  }
  static Future<Messages> messageList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.get('userId').toString();
    String authToken = prefs.get('authToken').toString();
    var headers = {
      'X-Auth-Token': authToken,
      'X-User-Id': userId,
    };

    final response = await http.get(
        Uri.parse('https://open.rocket.chat/api/v1/channels.messages?roomId=kd7Mcsu9A4wSqkaNi'),
        headers: headers
    ).timeout(Duration(seconds: 10));

    if (response.statusCode == 200) {
      Messages messagesData = Messages.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return messagesData;
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      Messages messagesData = Messages.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return messagesData;
    }
  }
}
