import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/chat/chat_form_page.dart';
import 'package:flutter_chat_balcoder/ui/home/contact/contact_list_page.dart';
import 'package:flutter_chat_balcoder/ui/home/contact/model/contact_form_page.dart';
import 'package:flutter_chat_balcoder/ui/home/contact/model/contact_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin
{
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
    appBar: AppBar(
    backgroundColor: Colors.pink[400],
    bottom: TabBar(
      indicatorColor: Colors.white,
      controller: _tabController,
      tabs: [
      Tab (icon: Icon(Icons.person, color: Colors.white)),
      Tab (icon: Icon(Icons.message, color: Colors.white)),
      ]
    ),
    title: Center(child: Text( "LISTA DE CONTACTOS")),
      ),
    body: Center(
      child: TabBarView(
        children: [
        ContactListPage (),
        Container( color: Colors.white),
        ],
        controller: _tabController,

      ),



    ),
    floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.pink[400],
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute (builder: (_){
        if (_tabController.index == 0) {
          print ("PRESSED CONTACT PAGE");
          return ContactFormPage (contactModel: new ContactModel(),);}

          else {
            print ("PRESSED CHAT PAGE");
          
            return ChatFormPage ();
          

          }


        }



      )
      );




    },
    






    child: Icon( Icons.add )),
      
    );
  }
}