import 'package:easyscan/pages/details.dart';
import 'package:easyscan/pages/home.dart';
import 'package:easyscan/pages/view_pdf.dart';
import 'package:easyscan/wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyScan',
      home: Wrapper(),
      routes: {
        '/details': (context) => Details(),
        '/view_pdf': (context) => view_pdf(),
      },
    );
  }
}

