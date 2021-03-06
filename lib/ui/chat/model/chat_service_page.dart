import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/chat/model/chat_model.dart';
import 'package:flutter_chat_balcoder/ui/home/contact/model/contact_model.dart';

class ChatService {

final chatCollection = FirebaseFirestore.instance.collection('chatCollection');

addChat(ChatModel chatModel){
  chatCollection.add(chatModel.toJson()).then((value) {
    print("GUARDE CONTACTO");

  });

}
updateContact(){}
deleteContact(){}


}