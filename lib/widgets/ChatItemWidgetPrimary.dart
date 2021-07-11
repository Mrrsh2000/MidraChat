import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixty_days_chat/Config/Palette.dart';
import 'package:sixty_days_chat/Core/Me/GetProfile.dart';

class ChatItemWidgetPrimary extends StatefulWidget {
  const ChatItemWidgetPrimary({Key? key}) : super(key: key);

  @override
  _ChatItemWidgetPrimaryState createState() => _ChatItemWidgetPrimaryState();
}

class _ChatItemWidgetPrimaryState extends State<ChatItemWidgetPrimary> {
  String avatar = "";
  getName() async {
    bool result = await GetProfile.profile();
    if (result) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var getAvatar = prefs.get('avatar');
      avatar = getAvatar.toString();
    } else {
      print(result);
    }
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      getName();
    });
    return Container(
        child: Column(children: <Widget>[
          Row(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Column(children: [
                  Text(
                    'ارسال',
                    style: TextStyle(
                        color: Palette.selfMessageColor, fontFamily: "IRANYekan"),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Container(
                      child: Text(
                        DateFormat('kk:mm').format(
                            DateTime.fromMillisecondsSinceEpoch(1565888474278)),
                        style: TextStyle(
                            color: Palette.primaryBackgroundColor,
                            fontSize: 12.0,
                            fontStyle: FontStyle.normal,
                            fontFamily: "IRANYekan"),
                      ),
                      margin: EdgeInsets.only(top: 5),
                    )
                  ])
                ]),
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                decoration: BoxDecoration(
                    color: Palette.selfMessageBackgroundColor,
                    borderRadius: BorderRadius.circular(15.0)),
                margin: EdgeInsets.only(right: 10.0),
              ),
              CircleAvatar(
                backgroundImage: Image.network(avatar).image,
              ),
            ],
            mainAxisAlignment:
            MainAxisAlignment.end, // aligns the chatitem to right end
          ),
        ]));
  }
}
