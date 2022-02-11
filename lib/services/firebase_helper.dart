/* // TODO: turn firebase back on once needed 
//TODO: This is code helps to check Firebase connection during the development phase and should be removed in the future.
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('collection');

Future<void> getData() async {
  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _collectionRef.get();

  // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  print(allData);
}*/