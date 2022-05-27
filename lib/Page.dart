 import 'package:clientapp/Home.dart';
import 'package:clientapp/Panier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';
import 'package:flutter/widgets.dart';
import 'Favoris.dart';
import 'package:clientapp/my_flutter_app_icons.dart';

class Main_Page extends StatefulWidget {
  const Main_Page({Key? key}) : super(key: key);

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  List interfaces = [ Home() , Panier() , Favoris()  ,Profile() ];
  int currentindex =0 ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: interfaces[currentindex],
      bottomNavigationBar: BottomNavigationBar(

        type : BottomNavigationBarType.fixed ,
        onTap : (int index){
          setState (
                  () {
            currentindex=index;
          }
          );
        } ,
        currentIndex : currentindex ,
        selectedItemColor: Color(0xfff54749).withOpacity(0.7),
        unselectedItemColor: Colors.black,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  MyFlutterApp.home
              ),
              label: 'Accueil',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  MyFlutterApp.cart
              ),
              label:'Panier'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  MyFlutterApp.heart
              ),
              label: 'Favoris',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                MyFlutterApp.user,
              ),
              label: 'Profil'
          ),

        ],
      ),
    ));
  }
}