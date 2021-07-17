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
        crossAxisAlignment: CrossAxisAlignment.end,
        children:[
          // Text input
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
              ),
              margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.face,),
                        color: Colors.teal,
                        onPressed: () {

                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.attach_file_rounded,),
                        color: Colors.teal,
                        onPressed: () {

                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.camera_alt_rounded,),
                        color: Colors.teal,
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
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
                ],
              ),
            ),
          ),

         Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.teal),
            margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5),
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
                },
                color: Palette.primaryColor,
              ),
            ),
          ),
        ],
      ),
      width: double.infinity,
    );
  }
}
