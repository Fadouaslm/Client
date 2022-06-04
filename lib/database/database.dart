import 'package:clientapp/client/favoris.dart';
import 'package:clientapp/client/panier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid ;


  DatabaseService( { required this.uid});


  //Collectoin reference
  final CollectionReference clientCollection = FirebaseFirestore.instance.collection('client');


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

updatUserdata(){
    clientCollection.doc(uid).get().then((value) {
      if(!value.exists){
        clientCollection.doc(uid).set({"nom":"new user" , "panier":0.toInt(),"favoris":0.toInt()});
      }
    });
}
  int _existpanier(DocumentSnapshot snapshot){
    return  snapshot.get("panier").toInt();
  }

  Stream <int> get existpanier{

    return clientCollection.doc(uid).snapshots().map((snapshot) => _existpanier(snapshot));
  }
  int _existfavoris(DocumentSnapshot snapshot){
    return  snapshot.get("favoris").toInt();
  }

  Stream <int> get existfavoris{

    return clientCollection.doc(uid).snapshots().map((snapshot) => _existfavoris(snapshot));
  }
  changenom(String s){
    return clientCollection.doc(uid).update({"nom":s});
  }


}

