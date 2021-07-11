import 'package:flutter/material.dart';
import 'package:sixty_days_chat/Config/Palette.dart';

class NavigationPillWidget extends StatefulWidget {
  const NavigationPillWidget({Key? key}) : super(key: key);

  @override
  _NavigationPillWidgetState createState() => _NavigationPillWidgetState();
}

class _NavigationPillWidgetState extends State<NavigationPillWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Center(
              child: Wrap(
                children: [
                  Container(
                    width: 50,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    height: 5,
                    decoration: new BoxDecoration(
                        color: Palette.accentColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
