import 'dart:convert';

import 'package:sixty_days_chat/Core/Channel/Channel.dart';
import 'package:sixty_days_chat/Core/Channel/Messages.dart';
import 'package:sixty_days_chat/Core/Login/Login.dart';
import 'package:sixty_days_chat/Core/Me/GetProfile.dart';
import 'package:test/test.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('test login', () async {
    try {
      bool result = await Login.login("usertester85", "usertester85");

      print("login ==> " + result.toString());

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = prefs.get('userId');
      var authToken = prefs.get('authToken');
      print("userId ==> " + userId.toString());
      print("authToken ==> " + authToken.toString());
    } catch (error) {
      print("Error ==> " + error.toString());
    }
  });
  // test('test profile', () async {
  //   try {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //     bool result = await GetProfile.profile();
  //
  //     print("profile result ==> " + result.toString());
  //
  //     var name = prefs.get('name');
  //     var username = prefs.get('username');
  //     var avatar = prefs.get('avatar');
  //     print("name ==> " + name.toString());
  //     print("username ==> " + username.toString());
  //     print("avatar ==> " + avatar.toString());
  //   } catch (error) {
  //     print("Error ==> " + error.toString());
  //   }
  // });
  // test('test send message', () async {
  //   try {
  //     bool result = await Channel.sendMassage("hello");
  //
  //     print("send message result ==> " + result.toString());
  //
  //   } catch (error) {
  //     print("Error ==> " + error.toString());
  //   }
  // });
  test('test message list', () async {
    try {
      Messages result = await Channel.messageList();

      print("message list result ==> " + result.success.toString());
      print("total result ==> " + result.total.toString());
      print("messages.length result ==> " + result.messages.length.toString());
      print("messages[0].msg result ==> " + result.messages[0]['msg'].toString());
      print("messages[0].user result ==> " + result.messages[0]['u']['username'].toString());
      print("messages[0].ts result ==> " + result.messages[0]['ts'].toString().substring(11,16));
    } catch (error) {
      print("Error ==> " + error.toString());
    }
  });
}
