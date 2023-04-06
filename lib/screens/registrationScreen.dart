import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rrconstruction/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String rid = "registration_screen";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
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
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: "Enter Email", suffixIcon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                obscureText: passwordShow == false ? true : false,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter Password",
                  suffixIcon: GestureDetector(
                      child: Icon(Icons.remove_red_eye_outlined),
                      onTap: () {
                        setState(() {
                          passwordShow = !passwordShow;
                        });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
