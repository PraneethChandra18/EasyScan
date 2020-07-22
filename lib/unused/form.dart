import 'package:flutter/material.dart';
import 'package:easyscan/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthenticationForm extends StatelessWidget {

  final Size size;
  final Function toggle;
  final String type;

  AuthenticationForm({this.size,this.toggle,this.type});

  @override
  Widget build(BuildContext context) {

    String alternative;
    String alter_text;
    if(type=='Login')
    {
      alter_text = "Don't have an account ?";
      alternative = 'SignUp';
    }
    else {
      alter_text = 'Already have an account?';
      alternative = 'Login';
    }
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

                  SizedBox(height: 20.0),
                  Text(
                    type,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: lightprimarycolor,
                    ),
                  ),

                  SizedBox(height: 20.0),
                  Form(
                    child: Column(
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                          child: TextFormField(
                            cursorColor: primarycolor,
                            decoration: textInputDecoration.copyWith(labelText: 'Email',prefixIcon: Icon(Icons.person,color: primarycolor)),
                            onChanged: (val){},
                          ),
                        ),

                        SizedBox(height: 20.0),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                          child: TextFormField(
                            obscureText: true,
                            cursorColor: primarycolor,
                            decoration: textInputDecoration.copyWith(labelText: 'Password',prefixIcon: Icon(Icons.lock_outline,color: primarycolor)),
                            onChanged: (val){},
                          ),
                        ),

                        SizedBox(height: 20.0),

                        Container(
                          width: size.width * 0.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: FlatButton(
                              onPressed: (){},
                              color: lightprimarycolor,
                              padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
                              child: Text(
                                type,
                                style: TextStyle(
                                  color: primarycolor,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 40.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              alter_text,
                              style: TextStyle(
                                color: lightprimarycolor,
                                fontSize: 16.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: this.toggle,
                              child: Text(
                                '  $alternative',
                                style: TextStyle(
                                  color: lightprimarycolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Row(
                            children: <Widget>[
                             Expanded(
                               child: Divider(
                                 color: lightprimarycolor,
                                 height: 50.0,
                               ),
                             ),
                              Text(
                                  'OR',
                              style: TextStyle(
                                fontSize: 16,
                                color: lightprimarycolor,
                              ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: lightprimarycolor,
                                  height: 50.0,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: GestureDetector(
                            onTap: (){},
                            child: CircleAvatar(
                              backgroundColor: lightprimarycolor,
                              radius: 25,
                              child: SvgPicture.asset(
                                'assets/images/google.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
