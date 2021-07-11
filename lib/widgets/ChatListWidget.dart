import 'package:flutter/material.dart';
import 'package:sixty_days_chat/widgets/ChatItemWidgetGoust.dart';
import 'package:sixty_days_chat/widgets/ChatItemWidgetPrimary.dart';


class ChatListWidget extends StatelessWidget{
  final ScrollController listScrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
        child: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemBuilder: (context, index) {
            if(index % 2 == 0){
              return ChatItemWidgetGuest();
            }else{
              return ChatItemWidgetPrimary();
            }
          },
          itemCount: 20,
          reverse: true,
          controller: listScrollController,
        ));
  }
}