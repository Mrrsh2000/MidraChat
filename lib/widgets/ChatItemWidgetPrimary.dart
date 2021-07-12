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
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Row(children: [
                Text(
                  widget.massage.toString(),
                  style: TextStyle(
                      color: Palette.selfMessageColor, fontFamily: "IRANYekan"),
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
                  padding: const EdgeInsets.only(left: 4, right: 5),
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
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.blueAccent,
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(15),
            //       topRight: Radius.circular(15),
            //       bottomRight: Radius.circular(15),
            //     ),
            //   ),
            //   child: CircleAvatar(
            //     backgroundColor: Colors.blueAccent,
            //     backgroundImage: Image.network(avatar).image,
            //   ),
            // ),
          ],
          mainAxisAlignment:
              MainAxisAlignment.end, // aligns the chatitem to right end
        ),
      ]),
      margin: EdgeInsets.only(bottom: 10.0),
    );
  }
}
