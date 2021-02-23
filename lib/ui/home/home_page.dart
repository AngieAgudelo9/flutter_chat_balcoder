import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin
{
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(length: 2, initialIndex: 0, vsync: this);
  }





  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
    appBar: AppBar(
    bottom: TabBar(
      controller: _tabController,
      tabs: [
      Tab (icon: Icon(Icons.person)),
      Tab (icon: Icon(Icons.message)),
      ]
    ),
    title: Text( "Home"),
      ),
    body: Center(
      child: TabBarView(
        children: [
        Container( color: Colors.red),
        Container( color: Colors.blue),



        ],
        controller: _tabController,

      ),



    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon( Icons.add )),
      
    );
  }
}