import 'package:clientapp/client/favoris.dart';
import 'package:clientapp/client/panier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../auth/userdata.dart';

class DatabaseService {
  final String uid ;

  static String? sexe;

  DatabaseService( { required this.uid});


  //Collectoin reference
  final CollectionReference clientCollection = FirebaseFirestore.instance.collection('client');




//userdata
  Userdata _userdatasnap(DocumentSnapshot snapshot){


    return Userdata(name: snapshot.get("nom").toString(),  phone:snapshot.get("phone").toString(),sexe:snapshot.get("sexe").toString());
  }

  Stream <Userdata> get userData{

    return clientCollection.doc(uid).snapshots().map((snapshot) =>_userdatasnap(snapshot));
  }





//panier
  List <Panier> _panierList(QuerySnapshot snapshot ){

    return snapshot.docs.map((doc)
    {

      return Panier(nom: doc.get("nom")??"", prix: doc.get("prix")??0,nomRest:doc.get("nomRestarant")??'' ,quentite:doc.get("quentite")??'');


    }).toList();

  }
  Stream<List <Panier>> get panier {
    return clientCollection.doc(uid).collection("Panier").snapshots().map((snapshot)=> _panierList(snapshot));

  }
  List <Favoris> _favorisList(QuerySnapshot snapshot ){

    return snapshot.docs.map((doc)
    {

      return Favoris(nomPlat: doc.get("nomPlats")??"",nomRest:doc.get("nomRestarant")??"",cate:doc.get("categorer")??"" );


    }).toList();

  }
  Stream<List <Favoris>> get favoris {
    return clientCollection.doc(uid).collection("favoris").snapshots().map((snapshot)=> _favorisList(snapshot));

  }


  Future deletePanier(String nomplat,String nomRes)async {

    return
      clientCollection.doc(uid).collection("panier").doc(nomplat+nomRes).delete();
  }
  Future deleteFavoris(String nomplat,String nomRes)async {

    return
      clientCollection.doc(uid).collection("favoris").doc(nomplat+nomRes).delete();
  }
  Future updateFavoris(String s,String cate){
    return clientCollection.doc(uid).collection("Favoris").doc(s).set({"categore":cate}) ;
  }
  Future updatePanier(String s,int prix,int qauntite){
    return clientCollection.doc(uid).collection("Panier").doc(s).set({"prix":prix,"qauntite": qauntite}) ;
  }




  changenom(String s){
    return clientCollection.doc(uid).set({"nom":s});
  }

  String sexe1(){
    clientCollection.doc(uid).get().then((value) => sexe= value.get("sexe"));
    sexe??="M";
    return sexe!;
  }

}

