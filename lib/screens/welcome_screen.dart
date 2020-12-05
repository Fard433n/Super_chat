import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation =
        ColorTween(begin: Colors.black, end: Colors.teal).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose(); // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: TypewriterAnimatedTextKit(
                      onTap: () {
                        print('Tap Event');
                      },
                      text: ["SUPER CHAT"],
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        fontFamily: "Agne",
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.topStart,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            // Container(
            //   child: Row(
            //     children: [
            //       Text(
            //         'the group chat',
            //         style:
            //             TextStyle(fontSize: 25.0, fontWeight: FontWeight.w200),
            //       ),
            //     ],
            //   ),
            //
            SizedBox(
              width: 150.0,
              child: TypewriterAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "Group Chat App By Shahid",
                  ],
                  textStyle: TextStyle(fontSize: 15.0, fontFamily: "Agne"),
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),

            SizedBox(
              height: 120,
              width: 120,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
