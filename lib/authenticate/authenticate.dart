import 'package:easyscan/authenticate/google_auth_form.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool loginpage = true;

//  void toggle()
//  {
//    setState(() {
//      loginpage = (!loginpage);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return GoogleAuthForm();
  }
}
