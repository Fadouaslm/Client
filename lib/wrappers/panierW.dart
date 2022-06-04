import 'package:clientapp/Panier.dart';
import 'package:clientapp/database/database.dart';
import 'package:clientapp/panierPleine.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../auth/user.dart';



class PanierW extends StatelessWidget {
  const PanierW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
  return StreamBuilder<int>(
    stream: DatabaseService(uid: user!.uid).existpanier,
    builder: (context, snapshot) {
      if (snapshot.hasData){
        if (snapshot.data==0){
          return Panier();
        }else{
          return PanierPleine();
        }
      }else{
      return Panier();}
    }
  );
  }
}
