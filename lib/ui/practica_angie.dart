import 'package:flutter/material.dart';

class Practica_Angie extends StatefulWidget {
  @override
  _Practica_AngieState createState() => _Practica_AngieState();
}

class _Practica_AngieState extends State<Practica_Angie> {
  double decimalNumer = 4.5;
  bool myBool = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return new Scaffold(
      body: GestureDetector(
          onTap: () {
            print("ONTAP");

            setState(() {
              myBool = !myBool;
            });
          },
          child: Column(
            children: [


              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.orange[400]),
                  height: _height * 0.75,
                  width: _width * 20.0,



        
                    child: Container(
                      child: Text("LUNES",
                          style: TextStyle(
                              color: Colors.red[700], fontSize: 35.0)),



                    ), 
                  
                  ), 




              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.orange[100]),
                height: _height * 0.25,
                width: _width * 20.0,
              ),
            ],
          )),
    );
  }
}
