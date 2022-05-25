import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/constants.dart';
import 'package:flash_chat_flutter/components.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Buttons(
                  colorString: Colors.lightBlueAccent,
                  textString: 'Log in',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final loggedInUser =
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                      if (loggedInUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  }),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 16.0),
              //   child: Material(
              //     color: Colors.lightBlueAccent,
              //     borderRadius: const BorderRadius.all(Radius.circular(32.0)),
              //     elevation: 5.0,
              //     child: MaterialButton(
              //       onPressed: () {},
              //       minWidth: 200.0,
              //       height: 42.0,
              //       child: const Text('Log in'),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
