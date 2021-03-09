import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/home/contact/model/contact_model.dart';

class ContactService {
  final contactCollection =
      FirebaseFirestore.instance.collection('contactCollection');

  addContact(ContactModel contactModel) {
    contactCollection.add(contactModel.toJson()).then((value) {
      print("GUARDE CONTACTO");
    });
  }


  updateContact(ContactModel contactModel) {
    contactCollection
        .doc(contactModel.key)
        .update(contactModel.toJson())
        .then((value) {
      print("GUARDE CONTACTO");
    });
  }

  deleteContact( ContactModel contactModel) {
    contactModel.isDeleted = true;

    
    contactCollection
        .doc(contactModel.key)
        .update(contactModel.toJson())
        .then((value) {
      print("GUARDE CONTACTO");

  });
}
}
