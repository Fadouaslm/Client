import 'package:auto_size_text/auto_size_text.dart';
import 'package:clientapp/Page.dart';
import 'package:clientapp/classe1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Click_restaurant.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  List<Map<String, String>> restaurant = [
    {'Picture': "asset/DAMI'S.jpg", 'Name': "DAMI'S"},
    {'Picture': "asset/DAMI'SB.jpg", 'Name': "DAMI'S in black "},
    {'Picture': "asset/Privé.jpg", 'Name': "Privé"},
    {'Picture': "asset/DAMI'S.jpg", 'Name': "DAMI'S"},
    {'Picture': "asset/DAMI'SB.jpg", 'Name': "DAMI'S in black "},
    {'Picture': "asset/Privé.jpg", 'Name': "Privé"},
  ];
  var controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
          Column(
            children: [
              SizedBox(height: 10.h,) ,
              AutoSizeText('Restaurant' , style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontFamily: 'Poppins',

              ),),
              SizedBox(height: 10.h,) ,
            ],
          ) ,
          leading: Icon(
            Icons.arrow_back,
            size: 28.sp,
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          shadowColor:  Colors.transparent,
          foregroundColor:Colors.black ,
        ),
        body: Column(
          children: [
            SizedBox(height: 10.h),
            Expanded(
              child: Scrollbar(
                showTrackOnHover: true,
                radius: Radius.circular(50.sp),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: restaurant.length,
                    itemBuilder: (context, index) {
                      final url = restaurant[index]['Picture'];
                      final nom = restaurant[index]['Name'];
                      return Container(
                          height: 170.h,
                          width: 330.w,
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 15.w),
                                    Container(
                                      height: 110.h,
                                      width: 150.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20.sp),
                                        image: DecorationImage(
                                            image: AssetImage(url!),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 40.h,
                                            width: 142.h,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xffffda82),
                                                  width: 1.w,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                              BorderRadius.circular(18.sp),
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                ' $nom ',
                                                maxLines: 3,
                                                style: TextStyle(
                                                  fontSize: 19.sp,
                                                  color: Colors.black,
                                                  fontFamily: 'PoppinsThin',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 29.h,
                                        ),
                                        Container(
                                            height: 25.h,
                                            width: 84.h,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Classe1.classe= Click_restaurant(restaurant_name: restaurant[index]['Name'], restaurant_pic: restaurant[index]['Picture']);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Main_Page()));
                                                },
                                                child: Text(
                                                  'Découvrir',
                                                  style: TextStyle(
                                                    fontSize: 8.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    primary: Color(0xffF54749),
                                                    shape:
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          18),
                                                    )))),
                                      ],
                                    ),
                                  ]),
                              SizedBox(
                                height: 17.h,
                              ),
                              Container(
                                height: 1.h,
                                width: 300.w,
                                child: Divider(
                                  thickness: 2.w,
                                  color: Color(0xffF54749),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              )
                            ],
                          ));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
