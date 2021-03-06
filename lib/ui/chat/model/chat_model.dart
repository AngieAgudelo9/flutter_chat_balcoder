import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String key;
  String message;
  String sendtoUID;
  String iud;
  Timestamp createdDate;

  ChatModel({this.key, this.message, this.sendtoUID, this.iud, this.createdDate});

//toJson: nos ayuda a pasar información avanzada 
  toJson() {
    return {
      "key": key,
      "message": message,
      "sendtoUID": sendtoUID,
      "iud": iud, 
      "createdDate": createdDate,
 
    };
  }

  factory ChatModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ChatModel(

    key: snapshot.data()['id'],
    message: snapshot.data()['message'],
    sendtoUID: snapshot.data()['sendtoUID'],
    iud: snapshot.data()['iud'],
    createdDate: snapshot.data()['createdDate'],

    );

 


  }
}
