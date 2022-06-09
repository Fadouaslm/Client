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
}