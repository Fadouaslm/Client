import 'package:clientapp/database/restdata.dart';
import 'package:clientapp/restaurant/restaurant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Food.dart';
import 'Page.dart';
import 'auth/user.dart';
import 'classe1.dart';
import 'database/database.dart';


class Catego extends StatefulWidget {
  final String restaurant_id,categorie;
  const Catego({Key? key,required this.restaurant_id,required this.categorie}) : super(key: key);

  @override
  State<Catego> createState() => _CategoState();
}

class _CategoState extends State<Catego> {
  String plasImage="";
  String foodImage="";
  List<Plat> plats=[];
  getImage()async{
    await RestauService().getplatImage(widget.categorie) ;
    await RestauService().getfoodImage(widget.categorie);
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

getImage();
foodImage=RestauService.foodImage;
plasImage=RestauService.plasImage;
    return   StreamBuilder<List<Plat>>(
      stream: RestauService().categoreList(widget.restaurant_id, widget.categorie),
      builder: (context, snapshot) {

        if (snapshot.hasData){
          plats =snapshot.data!;
          getImage();
          foodImage=RestauService.foodImage;
          plasImage=RestauService.plasImage;
          print(foodImage);
return ListView.builder(
    physics: BouncingScrollPhysics(),
    itemCount: plats.length,
    itemBuilder: (BuildContext context, int index) {

      final String nom = plats[index].nom;
      final int prix = plats[index].prix;



      return GestureDetector(
        onTap: () async{

        var t= await DatabaseService(uid: user!.uid).existPlat(plats[index]);
          Classe1.classe=Food(plat: plats[index],);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  Main_Page()));
        },
        child: Stack(
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
                                          '$nom',
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
                                        '$prix' + '.00 DA',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color:
                                          Color(0xffF54749),
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
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
            Stack(
              children: [
                Container(
                  height: 110.h,
                  width: 110.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(plasImage),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 15.h, horizontal: 2.w),
                  height: 80.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(foodImage),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
        }else {return Container();}

      }
    );
  }
}
