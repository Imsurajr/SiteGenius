import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rrconstruction/screens/homeScreen.dart';
import 'loginScreen.dart';
import 'registrationScreen.dart';
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
                Text(
                  'BuildMate',
                  // speed: (Duration(milliseconds: 90)),
                  style: GoogleFonts.cabin(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ElevatedButton(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
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
                  padding: EdgeInsets.all(10.0),
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
            SizedBox(
              height: 20,
            ),
            // TextButton(
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all(Colors.white),
            //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //       RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20.0),
            //       ),
            //     ),
            //   ),
            //   onPressed: () async {
            //     await signup();
            //   },
            //   child: Image(image: AssetImage('images/google.png')),
            // ),

            GestureDetector(
              onTap: () async {
                await signup();
              },
              child: CircleAvatar(
                radius: 30,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('images/google.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signup() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
