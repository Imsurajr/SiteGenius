import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'registrationScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String wid = "welcome_screen";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation =
        ColorTween(begin: Colors.teal, end: Colors.black).animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
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
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: MediaQuery.of(context).devicePixelRatio * 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                // AnimatedTextKit(
                //   animatedTexts: [
                //     WavyAnimatedText(
                      Text('BuildMate',
                      // speed: (Duration(milliseconds: 90)),
                      style : GoogleFonts.cabin(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                  //   ),
                  // ],
                // )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Login",
                    style: GoogleFonts.openSans(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.lid);
                }),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Register",
                    style: GoogleFonts.openSans(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.rid);
                }),
          ],
        ),
      ),
    );
  }
}
