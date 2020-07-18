import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easyscan/constants.dart';

class GoogleAuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF162367),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/ESLogo.jpg',
                    width: size.width*0.4,
                    height: size.height * 0.2,
                  ),

                  SizedBox(height: size.height*0.2),


                  GestureDetector(
                    onTap: (){print("Google");},
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.6,
                      decoration: BoxDecoration(
                          color: lightprimarycolor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(


                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: lightprimarycolor,
                            radius: 30,
                            child: SvgPicture.asset(
                              'assets/images/google.svg',
                              height: 30,
                              width: 30,
                            ),
                          ),

                          Text(
                              'SignIn with Google',
                            style: TextStyle(
                              color: primarycolor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            )
                          ),

                        ],


                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),

                  GestureDetector(
                    onTap: (){print("Guest");},
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.6,
                      decoration: BoxDecoration(
                        color: lightprimarycolor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: lightprimarycolor,
                            radius: 30,
                            child: Icon(Icons.person,color: primarycolor),
                          ),

                          Text(
                              'SignIn as Guest',
                              style: TextStyle(
                                color: primarycolor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              )
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

