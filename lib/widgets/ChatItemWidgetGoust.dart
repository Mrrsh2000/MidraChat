import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sixty_days_chat/Config/Palette.dart';

class ChatItemWidgetGuest extends StatefulWidget {
  const ChatItemWidgetGuest(
      {Key? key,
      required this.username,
      required this.time,
      required this.massage})
      : super(key: key);
  final String massage;
  final String username;
  final String time;

  @override
  _ChatItemWidgetGuestState createState() => _ChatItemWidgetGuestState();
}

class _ChatItemWidgetGuestState extends State<ChatItemWidgetGuest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Palette.otherMessageBackgroundColorAvatar,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Palette.otherMessageBackgroundColorAvatar,
                      child: Text(
                        widget.username.toString().substring(0, 1).toUpperCase(),
                        style: TextStyle(
                            color: Palette.otherMessageColorAvatar,
                            fontFamily: "IRANYekan",
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(children: [
                  Text(
                    widget.username.toString(),
                    style: TextStyle(
                        color: Palette.otherMessageColor,
                        fontFamily: "IRANYekan"),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.massage.toString(),
                        style: TextStyle(
                            color: Palette.otherMessageColor,
                            fontFamily: "IRANYekan"),
                      )
                    ],
                  ),
                  Container(
                    child: Text(
                      widget.time.toString().substring(11, 16),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontStyle: FontStyle.normal,
                          fontFamily: "IRANYekan"),
                    ),
                    margin: EdgeInsets.only(top: 5),
                  ),
                ]),
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
                decoration: BoxDecoration(
                  color: Palette.otherMessageBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                margin: EdgeInsets.only(left: 5.0),
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
