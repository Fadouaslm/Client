import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'adress.dart';

class Complet_Order extends StatefulWidget {
  const Complet_Order({Key? key}) : super(key: key);

  @override
  State<Complet_Order> createState() => _Complet_OrderState();
}

class _Complet_OrderState extends State<Complet_Order> {
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child: Scaffold(
        body: Column(
          children: [
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
                      SizedBox(
                        width: 20.w,
                      ),
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
            SizedBox(height: 40.h,) ,
            Container(
              height: 200.h,
              width: 300.w,
              margin: EdgeInsets.symmetric(horizontal: 57.w),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/Location.png"),
                ),
              ),
            ),
            SizedBox(height: 50.h,) ,
            SizedBox(
              width: 350.w,
              child: AutoSizeText(
                '''Veuillez activer votre location pour continuer.''',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  //  fontWeight: FontWeight.bold ,
                ),
              ),
            ),
            SizedBox(
              height: 81.h,
            ),
            SizedBox(
              width: 220.w,
              height: 70.h,
              child: ElevatedButton(
                onPressed: () {},
                child: AutoSizeText(
                  'Activer Location',
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontFamily: 'Poppins',
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey,
                    primary: Color(0xffffda82),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 220.w,
              height: 70.h,
              child: ElevatedButton(
                onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Adress()));},
                child: AutoSizeText(
                  'Insérer une adresse',
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontFamily: 'Poppins',
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey,
                    primary: Color(0xffffda82),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),

          ],
        ),
      ));
  }
}
