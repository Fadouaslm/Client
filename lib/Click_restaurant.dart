import 'package:auto_size_text/auto_size_text.dart';
import 'package:clientapp/Page.dart';
import 'package:clientapp/classe1.dart';
import 'Food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Click_restaurant extends StatefulWidget {

  final restaurant_id ;
  const Click_restaurant({Key? key,required this.restaurant_id}) : super(key: key);

  @override
  State<Click_restaurant> createState() => _Click_restaurantState();
}

class _Click_restaurantState extends State<Click_restaurant> {

  List<Map<String, String>> plats = [
    {'Nom': 'Burger', 'Prix': '400'},
    {'Nom': 'Cheeseburger', 'Prix': '500'},
    {'Nom': 'Veggie Burger', 'Prix': '250'},
    {'Nom': 'Burger Special', 'Prix': '600'},
    {'Nom': 'Burger Simple', 'Prix': '200'},
  ];

  List<Map<String, String>> platspizza = [
    {'Nom': 'pizza', 'Prix': '400'},
    {'Nom': 'Piiza Poulet', 'Prix': '500'},
    {'Nom': 'Pizza Margerit', 'Prix': '250'},
    {'Nom': 'Burger 4 Fromages', 'Prix': '600'},
    {'Nom': 'Burger Simple', 'Prix': '200'},
  ];

  List<Map<String, String>> platssandwich = [
    {'Nom': 'Sandwich', 'Prix': '400'},
    {'Nom': 'Sandwich Special', 'Prix': '500'},
    {'Nom': 'Sandwich Poulet', 'Prix': '250'},
    {'Nom': 'Sandwich viande-hachée', 'Prix': '600'},
    {'Nom': 'Burger Simple', 'Prix': '200'},
  ];

  var  platstacos = [
    {'Nom': 'Tacos', 'Prix': '400'},
    {'Nom': 'Tacos Mexicain', 'Prix': '500'},
    {'Nom': 'Tacos Poulet', 'Prix': '450'},
    {'Nom': 'Tacos Special', 'Prix': '600'},
    {'Nom': 'Tacos Gratinie', 'Prix': '400'},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //SizedBox(width: 20.w,),
                              Icon(
                                Icons.arrow_back,
                                size: 28.sp,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 93.55.w,
                    ),
                    Expanded(
                      child: Stack(children: [
                        ClipPath(
                          clipper: Clipper(),
                          child: Container(
                            height: 205.h,
                            width: 225.w,
                            color: Color(0xffF54749),
                          ),
                        ),
                        ClipPath(
                          clipper: Clipper(),
                          child: Container(
                            height: 190.h,
                            width: 225.w,
                            child: Image.asset(
                              "asset/burgerp.png",////////////////////////////////////////////
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25.w,
                    ),
                    Container(
                        height: 40.h,
                        width: 152.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffF54749),
                              width: 1.w,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(18.sp),
                        ),
                        child: AutoSizeText(
                          " ${widget.restaurant_id} ",
                          style: TextStyle(
                            fontSize: 19.sp,
                            color: Colors.black,
                            fontFamily: 'PoppinsThin',
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  //height: 40.h,
                  //width: 344.w,
                  child: TabBar(
                    //controller: tabController,
                    isScrollable: true,
                    labelColor: Color(0xffffda82),
                    unselectedLabelStyle: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                    labelStyle: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                    unselectedLabelColor: Color(0xffF54749),
                    indicatorColor: Color(0xffffda82),
                    indicatorWeight: 3.w,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                        text: 'Burger',
                      ),
                      Tab(
                        text: 'Pizza',
                      ),
                      Tab(
                        text: 'Sandwich',
                      ),
                      Tab(
                        text: 'Tacos',
                      ),
                      Tab(
                        text: 'Autres',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Expanded(
                  child: TabBarView(children: [
                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: plats.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String nom = '${plats[index]['Nom']}';
                          final String prix =  '${plats[index]['Prix']}';
                          return GestureDetector(
                            onTap: () {
                              Classe1.classe=Food();

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
                                          image: AssetImage("asset/burgerp.png"),
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
                                          image: AssetImage("asset/burger.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: plats.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String nom = '${platspizza[index]['Nom']}';
                          final String prix = '${platspizza[index]['Prix']}';
                          return GestureDetector(
                            onTap: () {
                              Classe1.classe=Food();

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
                                      height: 100.h,
                                      width: 110.w,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("asset/pizzap.png"),
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
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: plats.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String nom = '${platssandwich[index]['Nom']}' ;
                          final String prix = '${platssandwich[index]['Prix']}';
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  Food()));
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
                                Row(
                                  children: [
                                    SizedBox(width: 5.w,) ,
                                    Stack(
                                      children: [
                                        Container(
                                          height: 100.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("asset/chickenp.png"),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 25.h, horizontal: 5.w),
                                          height: 50.h,
                                          width: 55.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("asset/chicken.png"),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(vertical: 18.h, horizontal: 27.w),
                                          height: 50.h,
                                          width: 55.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("asset/chicken.png"),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: platstacos.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String nom = '${platstacos[index]['Nom']}';
                          final String prix ='${platstacos[index]['Prix']}';
                          return GestureDetector(
                            onTap: () {
                              Classe1.classe=Food();

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
                                Row(
                                  children: [
                                    SizedBox(width: 5.w,) ,
                                    Stack(
                                      children: [
                                        Container(
                                          height: 100.h,
                                          width: 100.w,
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
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("asset/tacos.png"),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: plats.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String nom = '${plats[index]['Nom']}';
                          final String prix = '${plats[index]['Prix']}';
                          return GestureDetector(
                            onTap: () {
                              Classe1.classe=Food();

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
                                          image: AssetImage("asset/burgerp.png"),
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
                                          image: AssetImage("asset/burger.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ]),
                )
              ],
            ),
          )),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 00);
    var controllPoint = Offset(00, size.height);
    var endPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
