import 'package:flutter/material.dart';
import 'package:sixty_days_chat/Core/Channel/Channel.dart';
import 'package:sixty_days_chat/Core/Channel/Messages.dart';
import 'package:sixty_days_chat/widgets/ChatItemWidgetGoust.dart';
import 'package:sixty_days_chat/widgets/ChatItemWidgetPrimary.dart';


class ChatListWidget extends StatelessWidget{
  final ScrollController listScrollController = new ScrollController();
  
  @override
  Widget build(BuildContext context){
    return Expanded(
        child: FutureBuilder<Messages>(
          future: Channel.messageList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemBuilder: (context, index) {
                  if(snapshot.data!.messages[index]['u']['username'] == "usertester85"){
                    return ChatItemWidgetPrimary(time: snapshot.data!.messages[index]['ts'],massage: snapshot.data!.messages[index]['msg']);
                  }else{
                    return ChatItemWidgetGuest(userId: snapshot.data!.messages[index]['u']['_id'],name: snapshot.data!.messages[index]['u']['name'],time: snapshot.data!.messages[index]['ts'],massage: snapshot.data!.messages[index]['msg']);
                  }
                },
                itemCount: snapshot.data!.messages.length,
                reverse: true,
                controller: listScrollController,
              );
            } else if (snapshot.hasError) {
              return Text("No Message");
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
    );
  }
}