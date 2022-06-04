import 'package:auto_size_text/auto_size_text.dart';
import 'package:clientapp/my_flutter_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Food.dart';

class FavorisPleine extends StatefulWidget {

  const FavorisPleine({Key? key,}) : super(key: key);

  @override
  State<FavorisPleine> createState() => _FavorisPleineState();
}

class _FavorisPleineState extends State<FavorisPleine> {

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> plat= [
      {'Nom': 'Burger', 'Prix': '400' , 'PicP' : 'asset/burgerp.png' , 'Pic' : 'asset/burger.png' , 'counter' : '1'},
      {'Nom': 'Chicken', 'Prix': '500' , 'PicP' : 'asset/chickenp.png' , 'Pic' : 'asset/chicken.png' , 'counter' : '1'},
      {'Nom': 'Tacos Poulet', 'Prix': '550' , 'PicP' : 'asset/chickenp.png' , 'Pic' : 'asset/tacos.png' , 'counter' : '1'},
      {'Nom': 'Pizza 4 Fromages', 'Prix': '600' , 'PicP' : 'asset/pizzap.png' , 'Pic' : 'asset/pizza.png' , 'counter' : '1'},
      {'Nom': 'Tacos Spécial', 'Prix': '600' , 'PicP' : 'asset/chickenp.png' , 'Pic' : 'asset/tacos.png' , 'counter' : '1'},];

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title:
        Column(
          children: [
            SizedBox(height: 15.h,) ,
            AutoSizeText('Favoris' , style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontFamily: 'Poppins',

            ),),
            SizedBox(height: 15.h,) ,
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
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: plat.length,
                itemBuilder: (BuildContext context, int index) {
                  final String nom = '${plat[index]['Nom']}';
                  final String prix =  '${plat[index]['Prix']}.00';
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Food()));
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Container(
                                          height: 100.h,
                                          width: 325.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xffffda82),
                                              borderRadius:
                                              BorderRadius.circular(15.sp),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    blurRadius: 7,
                                                    spreadRadius: 2,
                                                    offset: Offset(3, 5))
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 97.w,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 15.h,
                                                  ),
                                                  Container(
                                                      height: 35.h,
                                                      width: 198.h,
                                                      decoration: BoxDecoration(
                                                        color:
                                                        Colors.transparent,
                                                        border: Border.all(
                                                            color: Colors.white,
                                                            width: 1.w,
                                                            style: BorderStyle
                                                                .solid),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            20.sp),
                                                      ),
                                                      child: FittedBox(
                                                        fit: BoxFit.contain,
                                                        child: Text(
                                                          ' $nom ',
                                                          style: TextStyle(
                                                            fontSize: 22.sp,
                                                            color: Color(
                                                                0xffF54749),
                                                            fontFamily:
                                                            'Poppins',
                                                            //fontWeight: FontWeight.bold ,
                                                          ),
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    height: 15.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 23.h,
                                                        width: 99.w,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                20.sp),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors.grey
                                                                      .withOpacity(
                                                                      0.5),
                                                                  blurRadius: 7,
                                                                  spreadRadius: 2,
                                                                  offset:
                                                                  Offset(3, 5))
                                                            ]),
                                                        child: FittedBox(
                                                          child: Text(
                                                            '$prix' + ' DA',
                                                            style: TextStyle(
                                                              fontSize: 15.sp,
                                                              color:
                                                              Color(0xffF54749),
                                                              fontFamily: 'Poppins',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 60.w,) ,
                                                      Icon(MyFlutterApp.heart_1 ,
                                                        color: Color(0xffF54749),
                                                        size: 20.sp,)
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            '${plat[index]['Pic']}'== "asset/pizza.png" ?
                            Stack(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 110.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("asset/pizzap.png"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 6.h, horizontal: 0.5.w),
                                  height: 90.h,
                                  width: 105.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("asset/pizza.png"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                              ],
                            ) :  '${plat[index]['Pic']}' == "asset/tacos.png" ?
                            Stack(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 110.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("asset/chickenp.png"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0.h, horizontal: 6.w),
                                  height: 85.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("asset/tacos.png"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                              ],
                            ) :  '${plat[index]['Pic']}' == "asset/chicken.png" ?
                            Stack(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 110.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("asset/chickenp.png"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20.h, horizontal: 0.w),
                                  height: 60.h,
                                  width: 65.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("asset/chicken.png"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
                                  height: 60.h,
                                  width: 65.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("asset/chicken.png"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                              ],
                            ) :
                            Stack(
                              children: [
                                Container(
                                  height: 110.h,
                                  width: 110.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('${plat[index]['PicP']}'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20.h, horizontal: 7.w),
                                  height: 70.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('${plat[index]['Pic']}'
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h,)
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
