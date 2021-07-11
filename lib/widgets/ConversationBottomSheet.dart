import 'package:flutter/material.dart';
import 'package:sixty_days_chat/Config/Palette.dart';
import 'package:sixty_days_chat/Config/Styles.dart';
import 'package:sixty_days_chat/widgets/ChatRowWidget.dart';
import 'package:sixty_days_chat/widgets/NavigationPillWidget.dart';

class ConversationBottomSheet extends StatefulWidget {
  @override
  _ConversationBottomSheetState createState() =>
      _ConversationBottomSheetState();

  const ConversationBottomSheet();
}

class _ConversationBottomSheetState extends State<ConversationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            NavigationPillWidget(),
            Center(
              child: Text(
                "Messages",
                style: Styles.textHeading,
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ChatRowWidget();
                },
                separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: 75, right: 20),
                      child: Divider(
                        color: Palette.accentColor,
                      ),
                    ),
                itemCount: 5)
          ],
        ),
      ),
    );
  }
}
