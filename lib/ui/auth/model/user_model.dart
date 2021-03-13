import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String key;
  String email;
  String uid;


  UserModel({this.key, this.email, this.uid});

//toJson: nos ayuda a pasar información avanzada 
  toJson() {
    return {
      "email": email,
      "uid": uid,
     
 
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(

    key: snapshot.data()['id'],
    email: snapshot.data()['email'],
    uid: snapshot.data()['uid'],

    );

 


  }
}
