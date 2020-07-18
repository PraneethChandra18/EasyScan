import 'package:easyscan/pages/home.dart';
import 'package:flutter/material.dart';
import 'authenticate/authenticate.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

