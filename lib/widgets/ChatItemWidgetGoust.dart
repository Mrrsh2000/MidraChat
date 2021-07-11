
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sixty_days_chat/Config/Palette.dart';

class ChatItemWidgetGuest extends StatefulWidget {
  const ChatItemWidgetGuest({Key? key}) : super(key: key);

  @override
  _ChatItemWidgetGuestState createState() => _ChatItemWidgetGuestState();
}

class _ChatItemWidgetGuestState extends State<ChatItemWidgetGuest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(children: [
                  Text(
                    'دریافت',
                    style: TextStyle(
                        color: Palette.otherMessageColor,
                        fontFamily: "IRANYekan"),
                  ),
                  Container(
                    child: Text(
                      DateFormat('kk:mm').format(
                          DateTime.fromMillisecondsSinceEpoch(1565888474278)),
                      style: TextStyle(
                          color: Palette.otherMessageColor,
                          fontSize: 12.0,
                          fontStyle: FontStyle.normal,
                          fontFamily: "IRANYekan"),
                    ),
                    margin: EdgeInsets.only(top: 5),
                  )
                ]),
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                decoration: BoxDecoration(
                    color: Palette.otherMessageBackgroundColor,
                    borderRadius: BorderRadius.circular(15.0)),
                margin: EdgeInsets.only(left: 10.0),
              ),
            ],
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      margin: EdgeInsets.only(bottom: 10.0),
    );
  }
}
