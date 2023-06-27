//import 'dart:async';
//import 'packare:connectivity/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/accueil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Auto Evaluaciones"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('point').get(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 150,
                      child: ImageIcon(AssetImage('assets/icon.png')),
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    child: Text("INICIAR"),
                    onPressed: () async {
                      checkinternetconnecion();
                    },
                  ),
                ),
                SizedBox(
                  height: 130,
                )
              ]),
            );
          }),
    );
  }

  void checkinternetconnecion() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog('No Internet', "You're not connected to a networks");
    } else if (result == ConnectivityResult.mobile) {
      _showDialog('Internet', "You're connected over mobile Data");
      Navigator.push(context, MaterialPageRoute(builder: (_) => accueil()));
    } else if (result == ConnectivityResult.wifi) {
      _showDialog('Internet', "You're connected over wifi Data");
      Navigator.push(context, MaterialPageRoute(builder: (_) => accueil()));
    }
  }

  _showDialog(Title, Text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(Title),
            content: Text(Text),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'))
            ],
          );
        });
  }
}
