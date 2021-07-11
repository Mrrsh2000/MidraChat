import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixty_days_chat/Config/Styles.dart';
import 'package:sixty_days_chat/Core/Me/GetProfile.dart';
import 'package:sixty_days_chat/widgets/ChatListWidget.dart';
import 'package:sixty_days_chat/widgets/ConversationBottomSheet.dart';
import 'package:sixty_days_chat/widgets/InputWidget.dart';
import 'package:sixty_days_chat/Config/Palette.dart';

class ConversationPage extends StatefulWidget {

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String name = "";
  String username = "";
  static String avatar = "";
  @override
  Widget build(BuildContext context) {
    getName() async {
      bool result = await GetProfile.profile();
      if(result){
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        var gatName = prefs.get('name');
        name = gatName.toString();
        var gatUsername = prefs.get('username');
        username = gatUsername.toString();
        var getAvatar = prefs.get('avatar');
        avatar = getAvatar.toString();
      }else{
        print(result);
      }
    }

    setState(() {
      getName();
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            name + "\n" + "@" + username,
            style: Styles.textHeading,
          ),
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: Image.network(avatar).image,
            ),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        getName();
                      });
                    },
                    icon: Icon(Icons.refresh),
                  color: Colors.black,
                )
              ],
            )
          ],
        ), // Custom app bar for chat screen
        body: Container(
          color: Palette.chatBackgroundColor,
          child: Stack(
            children: [
              Column(
                children: [
                  ChatListWidget(),
                  GestureDetector(
                    child: InputWidget(),
                    onPanUpdate: (details) {
                      if (details.delta.dy < 0) {
                        _scaffoldKey.currentState!
                            .showBottomSheet<Null>((BuildContext context) {
                          return ConversationBottomSheet();
                        });
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
