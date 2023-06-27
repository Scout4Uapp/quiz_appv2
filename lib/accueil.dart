//import 'packare:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:quiz_app/group.dart';
import 'package:quiz_app/homepage.dart';
import 'package:quiz_app/parametre.dart';
import 'package:quiz_app/statistic.dart';


// ignore: camel_case_types
class accueil extends StatefulWidget {
  const accueil({Key? key}) : super(key: key);

  @override
  State<accueil> createState() => _accueilState();
}

// ignore: camel_case_types
class _accueilState extends State<accueil> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    homepage(),
    statistic(),
    group(),
    parametre(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Autoevaluaciones por Tema"),
        centerTitle: true,
      ),
      body: Scrollbar(
          child: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      )),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(microseconds: 600),
        height: 50.0,
        items: const <Widget>[
          Icon(
            Icons.games,
            size: 20,
          ),
          Icon(
            Icons.stacked_bar_chart,
            size: 20,
          ),
          Icon(
            Icons.view_list_sharp,
            size: 20,
          ),
          Icon(
            Icons.settings,
            size: 30,
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
