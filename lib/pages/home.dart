import 'package:easyscan/capture_image.dart';
import 'package:flutter/material.dart';
import 'package:easyscan/constants.dart';
import 'package:flutter/widgets.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightprimarycolor,
      appBar: AppBar(
        backgroundColor: lightprimarycolor,
        title: Text(
            'EasyScan',
          style: TextStyle(
            color: primarycolor,
            letterSpacing: 1,
          ),
        ),
        shape: RoundedRectangleBorder(),
        elevation: 10.0,
      ),

      floatingActionButton: MultipleFloatingButton(size: size),
    );
  }
}
