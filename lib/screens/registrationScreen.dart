import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rrconstruction/constants.dart';
import 'package:rrconstruction/screens/homeScreen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String rid = "registration_screen";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                        borderSide: BorderSide(color: Colors.teal)),
                    hintText: "Enter Email",
                    suffixIcon: Icon(Icons.email)),
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
                  errorText: "Minimum 6 character",
                  errorStyle: TextStyle(color: Colors.red),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  focusColor: Colors.teal,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  suffixIcon: GestureDetector(
                      child: Icon(passwordShow == false ? Icons.visibility_off : Icons.visibility),
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
                    child: Text("Register" , style: kButtonTextStyle,),
                  ),
                  onPressed: () async {
                    try {
                      setState(() {
                        showSpinner = true;
                      });
                      final newUser =
                      await _auth.createUserWithEmailAndPassword(
                          email: email!, password: password!);

                      if (newUser != null) {
                        Navigator.pushNamed(context, HomeScreen.hid);
                      }

                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
