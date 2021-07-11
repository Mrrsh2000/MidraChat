import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixty_days_chat/Config/Palette.dart';
import 'package:sixty_days_chat/Config/Assets.dart';

class ChatAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ChatAppBar({Key? key}) : super(key: key);

  @override
  _ChatAppBarState createState() => _ChatAppBarState();

  @override
  Size get preferredSize => throw UnimplementedError();


}

class _ChatAppBarState extends State<ChatAppBar> {
  final double height = 100;
  String name = "";
  String username = "";
  String avatar = "";

  @override
  Widget build(BuildContext context) {
    var textHeading = TextStyle(color: Palette.primaryTextColor, fontSize: 20);
    var textStyle = TextStyle(color: Palette.secondaryTextColor);

    double width = MediaQuery.of(context).size.width;
    return Material(
        child: Container(
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
              )
            ]),
            child: Container(
                color: Palette.primaryBackgroundColor,
                child: Row(children: [
                  Expanded(
                      flex: 7,
                      child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  height: 70 - (width * .06),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 2,
                                          child: Center(
                                              child: Icon(
                                                Icons.attach_file,
                                                color: Palette.secondaryColor,
                                              ))),
                                      Expanded(
                                          flex: 6,
                                          child: Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text(name, style: textHeading),
                                                  Text("@" + username, style: textStyle)
                                                ],
                                              ))),
                                    ],
                                  )),
                              //second row containing the buttons for media
                              Container(
                                  height: 23,
                                  padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Photos',
                                        style: textStyle,
                                      ),
                                      VerticalDivider(
                                        width: 30,
                                        color: Palette.primaryTextColor,
                                      ),
                                      Text(
                                        'Videos',
                                        style: textStyle,
                                      ),
                                      VerticalDivider(
                                        width: 30,
                                        color: Palette.primaryTextColor,
                                      ),
                                      Text('Files', style: textStyle)
                                    ],
                                  )),
                            ],
                          ))),
                  //This is the display picture
                  Expanded(
                      flex: 3,
                      child: Container(
                          child: Center(
                              child: CircleAvatar(
                                radius: (80 - (width * .05)) / 2,
                                backgroundImage: new Image.network(username).image,
                              )))),
                ]))));
  }
}
