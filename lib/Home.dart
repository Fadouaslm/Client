import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clientapp/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  String User = 'user';
  int activeIndex=0;
  int activeIndex2=0;
  final Urlimages=[
    'images/promotakos.jpg',
    'images/promopizza.jpg',
    'images/promoburgur1.png',
    'images/oussss.png',
  ];
  final UrlRestaurants=[
    'images/Damis.jpg',
    'images/LePrivé .jpg',
    'images/LePrivé 2.jpg',
    'images/Otacos.jpg',
  ];


  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body:SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
              Column(
              children: [
              Column(
              children: [

                Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      AutoSizeText(
                        'Bienvenue,',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      AutoSizeText(
                        '@$User',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 330.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Color(0xffF54749),
                            width: 1.5.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xffF54749),
                            ),
                            contentPadding: EdgeInsets.all(10.0.h),
                            border: InputBorder.none,
                            hintText:'Recherche...',
                            hintStyle: TextStyle(
                              color: Color(0xffa7a7a7),
                              fontSize: 13.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            isCollapsed: true,
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ],
                  ),
                ],
              )
          ],
        ),
      SizedBox(height: 20.h,),
                  Center(
                    child: Column(
                      children: [
                        CarouselSlider.builder(
                            itemCount: Urlimages.length,
                            itemBuilder:(context,index,realIndex){
                              final urlImage=Urlimages[index];
                              return buildImage(urlImage, index);
                              } ,
                            options: CarouselOptions(
                                height: 160.h,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 4),
                              enlargeCenterPage: true,
                              pageSnapping: false,
                              onPageChanged: (index,reason)=>
                                  setState(()=>activeIndex=index)
                            )
                        ),
                        SizedBox(height: 20.h,),
                        buildIndicator(),
                      ],
                    ),
                  ),
                ],
              ),
                  SizedBox(height: 30.h,),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 30.h,
          ),
          Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                AutoSizeText(
                  'Restaurant :',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: 'ines',
                      fontWeight: FontWeight.bold),
                ),
              ],
          ),
                  SizedBox(height: 26.h,),
                  Row(
                    children: [SizedBox(width: 10.w,),
                      Container(
                        height: 150.h,
                        width: 350.w,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount:UrlRestaurants.length,
                          separatorBuilder:(context,_)=>SizedBox(width: 0.w,),
                          itemBuilder: (context,index)=>buildRestaurant(UrlRestaurants[index])
                         )
                        ),
                    ],
                  ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   TextButton(
                       onPressed: (){Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => Search()));},
                       child: AutoSizeText(
                         "Afficher plus",
                         style: TextStyle(
                           color: Colors.black,
                         //  fontWeight: FontWeight.bold,
                           fontSize: 14.sp,
                           decoration:TextDecoration.underline,
                          ),
                         ),
                       ),
                   Icon(
                     Icons.arrow_forward,
                     color: Colors.black,
                     size: 15.sp,

                   ),
                   SizedBox(width: 5.w,),
                 ],
               )
                ],
              ),
           ]
          ),
            )
       )
      );
  }
  Widget buildImage(String Urlimage,int index)=>Container(
    //height:40.h,
    //width: 340.w,
    margin: EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(
          image: AssetImage(Urlimage),
          fit: BoxFit.cover,
        )
    ),
  );
  Widget buildRestaurant(String urlRestaurant)=>Row(
    children: [
      SizedBox(width: 10.h,),
      Container(
        width: 200.w,
        //margin: EdgeInsets.symmetric(horizontal: .w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            image: DecorationImage(
              image: AssetImage(urlRestaurant),
              fit: BoxFit.cover,
            )
        ),
      ),
    ],
  );
  Widget buildIndicator()=>AnimatedSmoothIndicator(
    activeIndex:activeIndex,
    count:Urlimages.length,
    effect: ExpandingDotsEffect(
      dotWidth: 12.h,
      dotHeight: 9.h,
      activeDotColor: Color(0xffFEE199),
      dotColor: Color(0xffCCCCCC),
    ),
  );
}
