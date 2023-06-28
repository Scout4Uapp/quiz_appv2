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
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => const accueil()));
          },),
          title: const Text("¡Siempre Listo!"),
          centerTitle: true,
          ),
          body: Scrollbar(child: ListView(
            children: <Widget> [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text("Jouez"),
              ),
              Padding(padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                const SizedBox(
                  width: 60,
                  height: 20,
                ),  
                Row(
                  children: <Widget>[
                    Expanded(child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const getjason()));

                      },
                      child:Container(
                        height: 40,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.green,
                        // Modificado color: Border.all(color: Colors.white, width: 1),
                        border: Border.all(color: Colors.white, width: 1),),
                        child: const Center(child: Text("Preguntas", style: TextStyle(fontSize: 30),)),
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