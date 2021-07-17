import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sixty_days_chat/Config/Palette.dart';
import 'package:sixty_days_chat/Core/User/User.dart';

class ChatItemWidgetGuest extends StatefulWidget {
  const ChatItemWidgetGuest(
      {Key? key,
        required this.userId,
      required this.name,
      required this.time,
      required this.massage})
      : super(key: key);
  final String userId;
  final String massage;
  final String name;
  final String time;

  @override
  _ChatItemWidgetGuestState createState() => _ChatItemWidgetGuestState();
}

class _ChatItemWidgetGuestState extends State<ChatItemWidgetGuest> {
  String url = "false";
  _getAvatar() async {
    url = await User.getAvatar(widget.userId);
  }
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  widget.name.toString(),
                  style: TextStyle(
                      color: Palette.otherMessageColor,
                      fontFamily: "IRANYekan"),
                ),
                FutureBuilder<String>(
                  future: User.getAvatar(widget.userId),
                  builder: (context, snapshot) {
                    if(snapshot.data == null){
                      return CircleAvatar(
                          backgroundColor: Palette.otherMessageBackgroundColorAvatar,
                          child: Text(
                              widget.name.substring(0,1).toString().toUpperCase(),
                              style : TextStyle(
                                  color: Palette.otherMessageBackgroundColor,
                                  fontFamily: "IRANYekan")
                          )
                      );
                    }else{
                      return CircleAvatar(
                          backgroundColor: Palette.otherMessageBackgroundColorAvatar,
                          backgroundImage: Image.network(snapshot.data.toString()).image
                      );
                    }
                  }
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.massage.toString(),
                        style: TextStyle(
                            color: Palette.otherMessageColor,
                            fontFamily: "IRANYekan"),
                      ),

                    ],
                  ),
                  padding: EdgeInsets.all(15),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 2),
                  child: Text(
                    widget.time.toString().substring(11, 16),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "IRANYekan"),
                  ),
                ),
              ],
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 10.0),
      ),
    );
  }
}
