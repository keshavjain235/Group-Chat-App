import "package:flutter/material.dart";
import 'package:groupchatapp/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Chat SignIn"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            AuthMethods().signInWithGoogle(context);
          },
          child: Text("SignIn with Google"),
        ),
      ),
    );
  }
}
