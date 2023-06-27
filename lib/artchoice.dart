//import 'packare:connectivity/connectivity.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/accueil.dart';
import 'package:quiz_app/getjason.dart';
import 'package:quiz_app/group.dart';
import 'package:quiz_app/homepage.dart';
import 'package:quiz_app/parametre.dart';
import 'package:quiz_app/statistic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// ignore: camel_case_types
class artchoice extends StatefulWidget {
  const artchoice({Key? key}) : super(key: key);

  @override
  State<artchoice> createState() => _artchoiceState();
}

// ignore: camel_case_types
class _artchoiceState extends State<artchoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => accueil()));
          },),
          title: Text("¡Siempre Listo!"),
          centerTitle: true,
          ),
          body: Scrollbar(child: ListView(
            children: <Widget> [
              Padding(
                padding: EdgeInsets.all(15),
                child: const Text("Jouez"),
              ),
              Padding(padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                SizedBox(
                  width: 60,
                  height: 20,
                ),  
                Row(
                  children: <Widget>[
                    Expanded(child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => getjason()));

                      },
                      child:Container(
                        height: 40,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.green,
                        // Modificado color: Border.all(color: Colors.white, width: 1),
                        border: Border.all(color: Colors.white, width: 1),),
                        child: Center(child: Text("Preguntas", style: TextStyle(fontSize: 30),)),
                      ),
                      ),
                    ),
                  ],
                )

                ],  
                )
                
              ),
            ],
          )),
          );
  }
}