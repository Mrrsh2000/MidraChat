import 'package:flutter/material.dart';
import 'package:sixty_days_chat/Config/Palette.dart';
import 'package:sixty_days_chat/Core/Channel/Channel.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({Key? key}) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final TextEditingController textEditingController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
              color:Colors.teal,
              borderRadius: BorderRadius.circular(50)
            ),
            margin: new EdgeInsets.symmetric(horizontal: 1.0),
            child: new IconButton(
              icon: new Icon(Icons.face),
              color: Colors.white,
              onPressed: () {

              },
            ),
          ),

          // Text input
          Flexible(
            child: Container(
              padding: EdgeInsets.all(18),
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Palette.primaryTextColor,
                    fontSize: 15.0,
                    fontFamily: "IRANYekan"),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'یک پیام بنویسید',
                  hintStyle: TextStyle(color: Palette.greyColor),
                ),
              ),
            ),
          ),

          // Send Message Button
          new Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.teal),
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Transform.rotate(
              angle: -45,
              child: IconButton(
                icon: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                ),
                onPressed: () async {
                  bool result =
                  await Channel.sendMassage(textEditingController.text);
                  if (result) {
                    textEditingController.text = '';
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("خطا ! پیام ارسان نشد",style: TextStyle(fontFamily: "IRANYekan"),),
                    ));
                  }
                  setState(()  {

                  });
                },
                color: Palette.primaryColor,
              ),
            ),
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
    );
  }
}
