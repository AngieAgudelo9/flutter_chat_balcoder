import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/home/contact/contact_service.dart';
import 'package:flutter_chat_balcoder/ui/home/contact/model/contact_form_page.dart';
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
        stream: _contactService.contactCollection
            .where('isDeleted', isEqualTo: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//switch: loading... un iconito de cargando la informacion que voy a digitar en el siguiente SWITCH
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(child: new CircularProgressIndicator());

            default:
              _contactList = [];
              snapshot.data.docs.forEach((doc) {
                _contactList.add(new ContactModel.fromSnapshot(doc));
              });

              return ListView.builder(
                  itemCount: _contactList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return ContactFormPage(
                                contactModel: _contactList[index]);
                          }));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber[200],
                          child: Text(
                            _contactList[index].contactName[0].toUpperCase(),
                            style: TextStyle(color: Colors.pink),
                          ),
                        ),
                        title: Text(_contactList[index].contactName),
                        subtitle: Text(_contactList[index].phoneNumber),
                        trailing: GestureDetector(
                          onTap: () {
                            // _contactService.deleteContact(_contactList[index]);
                            var flatButton_aceptar = FlatButton(
                              child: Text("Aceptar"),
                              onPressed: () {
                                _contactService
                                    .deleteContact(_contactList[index]);
                                Navigator.of(context).pop();
                              },
                            );

                            var flatButton_cancelar = FlatButton(
                              child: Text("Cancelar"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            );

                            AlertDialog alert = AlertDialog(
                              title: Text("¿Estás seguro?"),
                              content: Text("¿Desea eliminar este contacto?"),
                              actions: [
                                flatButton_aceptar,
                                flatButton_cancelar,
                              ],
                            );

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          child: Icon(Icons.delete, color: Colors.pink[100]),
                        ));
                  });
          }
        },
      ),
    );
  }
}
