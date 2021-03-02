import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/home/contact/contact_service.dart';
import 'package:flutter_chat_balcoder/ui/home/contact/model/contact_model.dart';

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  ContactService _contactService = new ContactService();
  List<ContactModel> _contactList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _contactService.addContact(
    //    new ContactModel(
    //      contactName: "NOMBRE DE CONTACTO",
    //      phoneNumber: "123123123"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: _contactService.contactCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//switch: loading... un iconito de cargando la informacion que voy a digitar en el siguiente SWITCH
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(child: new CircularProgressIndicator());

            default:
              snapshot.data.docs.forEach((doc) {
                _contactList.add(new ContactModel.fromSnapshot(doc));
              });

              return ListView.builder(
                itemCount: _contactList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_contactList[index].contactName),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
