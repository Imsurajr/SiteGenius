import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String lid = "login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  bool showSpinner = false;
  bool passwordShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    // height: 200.0,
                    height: MediaQuery.of(context).devicePixelRatio * 55,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    focusColor: Colors.teal,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)
                    ),
                    hintText: "Enter Email", suffixIcon: Icon(Icons.email)),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                obscureText: passwordShow == false ? true : false,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter Password",
                  focusColor: Colors.teal,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)
                  ),
                  suffixIcon: GestureDetector(
                      child: Icon(Icons.remove_red_eye_outlined),
                      onTap: () {
                        setState(() {
                          passwordShow = !passwordShow;
                        });
                      }),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text("Login" , style: kButtonTextStyle,),
                  ),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });

                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email!, password: password!);

                      if (user != null) {
                        Navigator.pushNamed(context, HomeScreen.hid);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                    ;
                  })
            ],
          ),
        ),
      ),
    );
  }
}
