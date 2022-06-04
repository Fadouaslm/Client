import 'package:clientapp/Panier.dart';
import 'package:flutter/cupertino.dart';


class Classe2 extends StatelessWidget {
  Classe2({Key? key}) : super(key: key);
  static var classe;
  @override
  Widget build(BuildContext context) {

    if (classe == null) {
      return Panier();
    } else {
      return classe();
    }
  }
}
