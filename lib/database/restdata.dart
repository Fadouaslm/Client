
import 'package:clientapp/restaurant/restaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestauService {
static String plasImage ="https://firebasestorage.googleapis.com/v0/b/projet-8522f.appspot.com/o/Categories%2Fplat%2Fpizzap.png?alt=media&token=1a6c59b8-ba67-4c54-b2a8-c0a2abdcf8bb",foodImage="https://firebasestorage.googleapis.com/v0/b/projet-8522f.appspot.com/o/Categories%2Fplat%2Fpizzap.png?alt=media&token=1a6c59b8-ba67-4c54-b2a8-c0a2abdcf8bb",name="";
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
var t=doc.get("description").toString();
    print(t);
      return Plat(id: doc.get("ID").toString(), nom:doc.get("nom").toString(), resId: doc.get("ResID").toString(), descreption: doc.get("description").toString(), prix: doc.get("prix").toInt(), categore: doc.get("categorie").toString());


    }).toList();

  }
  Stream<List <Plat>> categoreList (String uid,String categorie){

    return restauCollection.doc(uid).collection(categorie).snapshots().map((snapshot)=> _categoreList(snapshot));

  }

  List<String> _tabcate(DocumentSnapshot snapshot){
    var t =  snapshot.get("Categories");

    List<String> z=[];
    for(int i=0;i<t.length;i++){
    z.add(t[i].toString());}
    return  z;
  }

  Stream <List<String>> tabcate(String id){

    return restauCollection.doc(id).snapshots().map((snapshot) => _tabcate(snapshot));
  }
String getfoodImage(String cate){
  FirebaseFirestore.instance.collection('Categories').doc(cate).get().then((value) => foodImage=value.get("foodImage"));


  return foodImage;
}
String getplatImage(String cate){
 FirebaseFirestore.instance.collection('Categories').doc(cate).get().then((value) => plasImage=value.get("platImage"));

  return plasImage;
}

String nom(String id){
   restauCollection.doc(id).get().then((value) => name= value.get("nom"));

    return name;

  }


}