import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreServices{
  FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;

   addData(String username){
    _firebaseFirestore.collection('username').add({
      'name':username
    });
  }

}