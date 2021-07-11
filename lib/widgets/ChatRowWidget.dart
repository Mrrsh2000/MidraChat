import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sixty_days_chat/Config/Assets.dart';
import 'package:sixty_days_chat/Config/Styles.dart';

class ChatRowWidget extends StatelessWidget {
  const ChatRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      child: Row(
        children: [
          Expanded(
              flex: 8,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(Assets.user),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(" Data Data ",style: Styles.textHeading,),
                        Text(
                          'What\'s up?',
                          style: Styles.subText,
                        )
                    ],),
                  )
                ],
              )),
          Expanded(
            flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(DateFormat('kk:mm').format(
                      DateTime.fromMillisecondsSinceEpoch(1565888474278)),
                    style: Styles.date,)
                ],
              )
          )
        ],
      ),
    );
  }
}
