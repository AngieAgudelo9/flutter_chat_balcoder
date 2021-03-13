import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_balcoder/ui/chat/model/chat_model.dart';
import 'package:flutter_chat_balcoder/ui/chat/model/chat_service_page.dart';

class ChatFormPage extends StatefulWidget {
  @override
  _ChatFormPageState createState() => _ChatFormPageState();
}

class _ChatFormPageState extends State<ChatFormPage> {
  ChatService _chatService = new ChatService();
  List<ChatModel> _chatList = [];
  TextEditingController _cMessage = TextEditingController();
  final _listViewController = ScrollController();

  String myUID;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Center(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink[400], 
            title: Center(child: Text("CHAT")),
          ),
          body: Column(children: [
            Container(
                height: _height * 0.75,
                color: Colors.transparent,
                child: StreamBuilder(
                  stream: _chatService.chatCollection
                      .orderBy('createdDate', descending: false)
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//switch: loading... un iconito de cargando la informacion que voy a digitar en el siguiente SWITCH
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Center(
                            child: new CircularProgressIndicator());

                      default:
                        _chatList = [];
                        snapshot.data.docs.forEach((doc) {
                        _chatList.add(new ChatModel.fromSnapshot(doc));
                        });

                        Future.delayed(const Duration(seconds: 100), () {

                          _listViewController.animateTo(
                          _listViewController.position.maxScrollExtent,
                          duration: Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn);


                        });

                        return ListView.builder(
                          itemCount: _chatList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                color: _chatList[index].sendtoUID == myUID
                                ? Colors.purple[200]
                                : Colors. brown[100],
                                borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                padding:const EdgeInsets.all(8.0),
                                child: Text( "ESTO ES UN/n MENSAJE",
                                style: TextStyle( color: Colors.red)
                            
                                
                                
                                )




                                ),)
                            );
                          },
                        );
                    }
                  },
                )),
            Container(
                height: _height * 0.13,
                child: Row(
                  children: [
                    Container(
                        width: _width * 0.8,
                        height: _height * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: TextFormField(
                              controller: _cMessage,
                              decoration: InputDecoration(
                                  labelText: "Message",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:
                                          BorderSide(color: Colors.blue)))),
                        )),
                    Container(
                      width: _width * 0.2,
                      child: FloatingActionButton(
                          mini: true,
                          onPressed: () {
                            ChatModel _chatModel = new ChatModel();
                            _chatModel.message = _cMessage.text;
                            _chatModel.sendtoUID = "111";
                            _chatModel.iud = "333";
                            _chatModel.createdDate = Timestamp.now();

                            _chatService.addChat(_chatModel);

                            _cMessage.text = "";
                          },
                          child: Icon(
                            Icons.send,
                            size: 18,
                          )),
                    ),
                  ],
                ))
          ])),
    );
  }
}
