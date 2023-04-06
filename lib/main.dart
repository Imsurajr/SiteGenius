import 'package:flutter/material.dart';
import 'package:rrconstruction/screens/welcomescreen.dart';
import 'screens/loginScreen.dart';
import 'screens/registrationScreen.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: WelcomeScreen.wid,
      routes: {
        WelcomeScreen.wid: (context) => WelcomeScreen(),
        LoginScreen.lid: (context) => LoginScreen(),
        RegistrationScreen.rid: (context) => RegistrationScreen(),
      },
    );
  }
}
//Todo : make welcome screen and login and registration sceen and start integrattingfirebase and impriove ui
