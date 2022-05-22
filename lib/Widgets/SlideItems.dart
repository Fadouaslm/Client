import 'package:flutter/material.dart';
import '../Model/slide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                //height: 10.h,
              ),
              Column(
                children: [
                  //SizedBox(height: 20.h,),
                  AspectRatio(
                    aspectRatio: 1/0.8,
                    child: Container(
                   //   width: 259.w,
                    //  height: 280.h,
                      decoration: BoxDecoration(
                        //shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: AssetImage(slideList[index].imageUrl),
                       //   fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              AutoSizeText(
                slideList[index].title,
                style: TextStyle(
                  //fontFamily: 'poppins',
                  fontSize: 24.sp,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                textScaleFactor: 1.2.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              AutoSizeText(
                slideList[index].description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 20.sp,
                    color: Colors.black),
                textScaleFactor: 0.96.sp,
              ),
            ],
          )
        ],
      ),
    );
  }
}
