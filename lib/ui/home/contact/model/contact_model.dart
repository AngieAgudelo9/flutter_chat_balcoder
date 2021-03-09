import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  String key;
  String contactName;
  String phoneNumber;
  bool isDeleted;

  ContactModel({this.key, this.contactName, this.phoneNumber, this.isDeleted});

//toJson: nos ayuda a pasar información avanzada 
  toJson() {
    return {
      "contactName": contactName,
      "phoneNumber": phoneNumber,
      'isDeleted' : isDeleted, 
    };
  }

  factory ContactModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ContactModel(

    key: snapshot.id,
    contactName: snapshot.data()['contactName'],
    phoneNumber: snapshot.data()['phoneNumber'],
    isDeleted: snapshot.data() ['isDeleted'],

    );

 


  }
}
