import 'package:easyscan/unused/form.dart';
import 'package:flutter/material.dart';
import 'package:easyscan/constants.dart';

class SignUp extends StatefulWidget {

  final Function toggle;

  SignUp({this.toggle});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
    return AuthenticationForm(size: _size, toggle: widget.toggle,type: 'Register');
  }
}
