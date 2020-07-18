import 'package:easyscan/unused/form.dart';
import 'package:flutter/material.dart';
import 'package:easyscan/constants.dart';
import 'package:flutter/rendering.dart';

class Login extends StatefulWidget {

  final Function toggle;

  Login({this.toggle});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    return AuthenticationForm(size: _size, toggle: widget.toggle,type: 'Login');
  }
}
