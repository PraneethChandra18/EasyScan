import 'package:flutter/material.dart';
import 'package:easyscan/constants.dart';
import 'package:flutter/widgets.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF162367),
      body: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Image.asset(
                  'assets/images/ESLogo.jpg',
                  width: size.width*0.4,
                  height: size.height * 0.4,
                ),
              ],
            ),
          ),
      ),
    );
  }
}
