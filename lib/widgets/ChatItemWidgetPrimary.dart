import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixty_days_chat/Config/Palette.dart';
import 'package:sixty_days_chat/Core/Me/GetProfile.dart';

class ChatItemWidgetPrimary extends StatefulWidget {
  const ChatItemWidgetPrimary(
      {Key? key, required this.time, required this.massage})
      : super(key: key);
  final String massage;
  final String time;

  @override
  _ChatItemWidgetPrimaryState createState() => _ChatItemWidgetPrimaryState();
}

class _ChatItemWidgetPrimaryState extends State<ChatItemWidgetPrimary> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Row(children: [
                SizedBox(
                  child: Expanded(
                    child: Column(
                      children: [
                        Text(widget.massage.toString(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Palette.selfMessageColor,
                                fontFamily: "IRANYekan")),
                      ],
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                    child: Text(
                      widget.time.toString().substring(11, 16),
                      style: TextStyle(
                          color: Palette.primaryBackgroundColor,
                          fontSize: 10.0,
                          fontStyle: FontStyle.normal,
                          fontFamily: "IRANYekan"),
                    ),
                    padding: EdgeInsets.only(left: 5, right: 1),
                    margin: EdgeInsets.only(top: 5),
                  )
                ]),
                Padding(
                  padding: EdgeInsets.only(left: 4, right: 5),
                  child: Icon(
                    Icons.theater_comedy,
                    color: Colors.black54,
                    size: 15,
                  ),
                )
              ]),
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
              decoration: BoxDecoration(
                color: Palette.selfMessageBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              margin: EdgeInsets.only(right: 5.0),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
        margin: EdgeInsets.only(bottom: 10.0),
      ),
    );
  }
}
