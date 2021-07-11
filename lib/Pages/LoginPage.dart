import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixty_days_chat/Core/Login/Login.dart';
import 'package:sixty_days_chat/Core/Me/GetProfile.dart';
import 'package:sixty_days_chat/Pages/ConversationPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  "Assets/images/logo.png",
                  width: 150,
                  height: 150,
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'پیامرسان ایرانی',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: "IRANYekan"),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'نام کاربری',
                  labelStyle: TextStyle(
                    fontFamily: "IRANYekan",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                textAlign: TextAlign.right,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'رمز عبور',
                  labelStyle: TextStyle(
                    fontFamily: "IRANYekan",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                //forgot password screen
              },
              textColor: Colors.blue,
              child: Text(
                'فراموشی رمز عبور',
                style: TextStyle(
                  fontFamily: "IRANYekan",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text(
                    'ورود',
                    style: TextStyle(fontFamily: "IRANYekan", fontSize: 20),
                  ),
                  onPressed: () async {
                    print(nameController.text);
                    print(passwordController.text);
                    bool result = await Login.login(nameController.text, passwordController.text);
                    if(result){
                      bool result = await GetProfile.profile();
                      if(result){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("وارد شدید!",style: TextStyle(fontFamily: "IRANYekan"),),
                        ));
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConversationPage()),
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("نام کاربری یا رمز عبور اشتباه است",style: TextStyle(fontFamily: "IRANYekan"),),
                      ));
                    }
                  },
                )),
            Container(
                child: Row(
              children: <Widget>[
                FlatButton(
                  textColor: Colors.blue,
                  child: Text(
                    'ساخت حساب',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "IRANYekan",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                ),
                Text(
                  'آیا اکانت نساخته اید؟',
                  style: TextStyle(
                    fontFamily: "IRANYekan",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ),
      ),
    );
  }
}
