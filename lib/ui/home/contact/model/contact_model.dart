import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  String contactName;
  String phoneNumber;

  ContactModel({this.contactName, this.phoneNumber});

//toJson: nos ayuda a pasar información avanzada 
  toJson() {
    return {
      "contactName": contactName,
      "phoneNumber": phoneNumber,
    };
  }

  factory ContactModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ContactModel(

    contactName: snapshot.data()['contactName'],
    phoneNumber: snapshot.data()['phoneNumber']

    );

 


  }
}
