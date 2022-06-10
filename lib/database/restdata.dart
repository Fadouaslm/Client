import 'package:clientapp/restaurant/restaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestauService {
  final CollectionReference restauCollection = FirebaseFirestore.instance.collection('Restaurant');
  
  List <String> _sugestion(QuerySnapshot snapshot ){

    return snapshot.docs.map((doc)
    {

      return doc.get("ImageUrl").toString();


    }).toList();

  }
  Stream<List <String>> get sugestion {
    return restauCollection.snapshots().map((snapshot)=> _sugestion(snapshot));

  }
  List <String> _promotion(QuerySnapshot snapshot ){

    return snapshot.docs.map((doc)
    {

      return doc.get("ImageUrl").toString();


    }).toList();

  }
  Stream<List <String>> get promotion {
    return FirebaseFirestore.instance.collection('Promotion').snapshots().map((snapshot)=> _promotion(snapshot));

  }


  List <Restaurant> _restaurantList(QuerySnapshot snapshot ){

    return snapshot.docs.map((doc)
    {

      return Restaurant(nom: doc.get("nom").toString(), longitude: doc.get("longitude").toDouble(), imageUrl: doc.get("ImageUrl").toString(), latitude:doc.get("latitude").toDouble(), id: doc.get("ID").toString(), phone: doc.get("phone").toString());


    }).toList();

  }
  Stream<List <Restaurant>> get restaurantList {
    return restauCollection.snapshots().map((snapshot)=> _restaurantList(snapshot));

  }

  PartRestaurant _partRestau(DocumentSnapshot snapshot){
    return  PartRestaurant(nom: snapshot.get("nom"), imageUrl: snapshot.get("ImageUrl"));
  }

  Stream <PartRestaurant>  partRestau (String uid){

    return restauCollection.doc(uid).snapshots().map((snapshot) => _partRestau(snapshot));
  }


  List <Plat> _categoreList(QuerySnapshot snapshot ){

    return snapshot.docs.map((doc)
    {

      return Plat(id: doc.get("ID").toString(), nom:doc.get("nom").toString(), resId: doc.get("ResId").toString(), descreption: doc.get("description").toString(), prix: doc.get("prix").toInt(), categore: doc.get("categorie"));


    }).toList();

  }
  Stream<List <Plat>> categoreList (String uid,String categorie){
    return restauCollection.doc(uid).collection(categorie).snapshots().map((snapshot)=> _categoreList(snapshot));

  }
}