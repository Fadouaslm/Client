import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Favoris.dart';
import 'Home.dart';
import 'Panier.dart';
import 'Profile.dart';
import 'my_flutter_app_icons.dart';
import 'package:clientapp/Search.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
 List <Map<String,String>> allRestaurants=[
   {'Nom':"Dami's",'Image':'images/Damis.jpg'},
   {'Nom':'Le privé','Image':'images/LePrivé 2.jpg'},
   {'Nom':"O'Tacos",'Image':'images/Otacos.jpg'},
   {'Nom':"Dami's",'Image':'images/Damis.jpg'},
   {'Nom':'Le privé','Image':'images/LePrivé 2.jpg'},
   {'Nom':"O'Tacos",'Image':'images/Otacos.jpg'},
   {'Nom':"Dami's",'Image':'images/Damis.jpg'},
   {'Nom':'Le privé','Image':'images/LePrivé 2.jpg'},
   {'Nom':"O'Tacos",'Image':'images/Otacos.jpg'},
   {'Nom':"Dami's",'Image':'images/Damis.jpg'},
   {'Nom':'Le privé','Image':'images/LePrivé 2.jpg'},
   {'Nom':"O'Tacos",'Image':'images/Otacos.jpg'},
   {'Nom':"Dami's",'Image':'images/Damis.jpg'},
   {'Nom':'Le privé','Image':'images/LePrivé 2.jpg'},
   {'Nom':"O'Tacos",'Image':'images/Otacos.jpg'},
 ];
    List interfaces = [Home(), Panier(), Favoris(), Profile()];
    int currentindex = 0;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              currentindex = index;
            });
          },
          currentIndex: currentindex,
          selectedItemColor: Color(0xfff54749).withOpacity(0.7),
          unselectedItemColor: Colors.black,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.home), label: 'Accueil'),
            BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.cart), label: 'Panier'),
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.heart),
              label: 'Favoris',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  MyFlutterApp.user,
                ),
                label: 'Profil'),
          ],
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
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

                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xffF54749),
                        ),
                        //contentPadding: EdgeInsets.all(.0.h),
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
              SizedBox(height: 30.h,),
              Container(
                height: 803.h,
                width: 355.w,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: allRestaurants.length,
                    itemBuilder: (context,index){
                      return buildListTile(allRestaurants,index);
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
  Widget buildListTile(List <Map<String,String>> allRestaurants,int index)=>Container(
    height: 90.h,
    width: 330.w,
  margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 13.w),
  decoration: BoxDecoration(
  border: Border.all(
  color: Color(0xffC4C4C4),
  width: 0.8.w,
  ),
  borderRadius: BorderRadius.circular(5.r),),
    child: Row(
      children: [
        Container(
          width: 90.w,
          height: 77.h,
          margin: EdgeInsets.only(left: 3.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: AssetImage('${allRestaurants[index]['Image']}'),
                fit: BoxFit.cover,
              )
          ),
          child: Row(
            children: [

            ],
          ),
        ),
        SizedBox(width: 30.w,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 8.h,),
            AutoSizeText(
              '${allRestaurants[index]['Nom']}',
              style: TextStyle(
              //  fontWeight: FontWeight.bold,
                fontFamily: 'regular',
                fontSize: 22.sp
              ),
            ),
          ],
        )
      ],
    ),
  );
}
