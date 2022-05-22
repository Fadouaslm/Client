import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clientapp/Home.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/BG.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 18.h,
                            ),
                            Container(
                              width: 110.w,
                              height: 40.h,
                              child: OutlinedButton(
                                child: AutoSizeText(
                                  "Découvrir",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffF54749),
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: Color(0xffF54749),
                                      width: 3,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                    Container(
                      height: 170.h,
                      width: 360.w,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                            'images/man.png',
                          ))),
                        ),
                      ),
                    ),

                    Container(
                     // width: 340.w,
                    //  height: 400.h,
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                            //  height: 80.h,
                            //  width: 360.w,
                              child: Center(
                                child: AutoSizeText(
                                  'Connexion',
                                  textScaleFactor: 0.96.sp,
                                  style: TextStyle(
                                      fontSize: 40.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h,),
                            Container(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 50.h,
                                        width: 288.w,
                                        color: Colors.transparent,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            counterText: "",
                                            suffix: TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Login()));
                                              },
                                              child: AutoSizeText(
                                                'Envoyer',
                                                style: TextStyle(
                                                  color: Color(0xffF54749),
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xffF54749),
                                                    width: 2.5.w),
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xffF54749),
                                                    width: 2.5.w),
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            labelText: 'Numéro de télephone',
                                            labelStyle: TextStyle(
                                              color: Color(0xffa7a7a7),
                                              fontSize: 16.sp,
                                            ),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          maxLength: 10,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        width: 288.w,
                                        height: 150.h,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 50.h,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                _textFieldOTP(
                                                    first: true, last: false),
                                                SizedBox(width: 8.w,),
                                                _textFieldOTP(
                                                    first: false, last: false),
                                                SizedBox(width: 8.w,),
                                                _textFieldOTP(
                                                    first: false, last: false),
                                                SizedBox(width: 8.w,),
                                                _textFieldOTP(
                                                    first: false, last: false),
                                                SizedBox(width: 8.w,),
                                                _textFieldOTP(
                                                    first: false, last: false),
                                                SizedBox(width: 8.w,),
                                                _textFieldOTP(
                                                    first: false, last: true),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 90.h,),
                                    ],
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    child: SizedBox(
                                      width: 195.w,
                                      height: 42.h,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Home()));
                                        },
                                        child: AutoSizeText(
                                          'Connexion',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.grey,
                                            primary: Color(0xffF54749),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          physics: NeverScrollableScrollPhysics(), // so it stops scrolling
        ),
      )
    ]));
  }

  Widget _textFieldOTP({bool? first, last}) {
    return Container(
      height: 45.h,
      width: 40.w,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: true,
          readOnly: false,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
            fontSize: 18.sp,
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.w, color: Colors.black12),
                borderRadius: BorderRadius.circular(5.r)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.w, color: Color(0xffF54749)),
                borderRadius: BorderRadius.circular(5.r)),
          ),
        ),
      ),
    );
  }
}
