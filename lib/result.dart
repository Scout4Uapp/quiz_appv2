//import 'dart:html';
//import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:quiz_app/artchoice.dart';

// ignore: camel_case_types
class result extends StatefulWidget {
  int marks;
  result({Key? key, required this.marks}) : super(key: key);

  @override
  State<result> createState() => _resultState(marks);
}

// ignore: camel_case_types
class _resultState extends State<result> {
  int marks;

  _resultState(this.marks);

  List<String> images = [
    "images/como_iniciar.png",
    "images/historia_escultismo.png",
    "images/nudos.png",
    "images/Primeros_Auxilios.png",
    "images/supervivencia.png",
  ];
  String message = "";
  String image = "";

  @override
  void initState() {
    if (marks < 20) {
      image = images[0];
      message = "Deberías esforzarte más \n" + "Tu Puntuación $marks";
    } else if (marks < 35) {
      image = images[1];
      message = "Puedes hacerlo mejor \n" + "Tu Puntuación $marks";
    } else {
      image = images[2];
      message = "Hiciste un gran trabajo \n" + "Tu Puntuación $marks";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultados",), centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center( child: Text("QUIZSTAR",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                ),
          ),
          Center(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(child: Text("¡Hazlo genial!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )),
          ),

          SizedBox(height: 70,),
          Container(
            child: Column(
              children: <Widget>[
              Material(
                child: Container(
                  width: 120.0,
                  height: 120.0,
                child: ClipRect(
                  child: Image (image: AssetImage(image
                  ),
                  ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(
                vertical: 5.0,
              horizontal: 10.0
              )),

              Center(
                child: Text(message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0),),
              )
            ]),
          ),

          Center(
            child: Padding(
              padding: const  EdgeInsets.all(12.0),
              child: Center(child: Text("", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  SizedBox(width: 50,),
                  Flexible(
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                      ),
                    ),
                    Text("My Record", style: TextStyle(fontSize: 20, color: Colors.black),),
                    Flexible(
                      child: Divider(
                        color: Colors.black,
                        height: 2,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      ),
                      SizedBox(width: 50,),
               ],
            ),
            SizedBox(width: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children:[
                    SizedBox(width: 50,),
                    Text("Wins"),
                    Text(marks.toString(),style: TextStyle(fontSize: 24, color: Colors.green),),
                    Text("Losses"),
                    Text((100-marks).toString(),style: TextStyle(fontSize: 24, color: Colors.red),),
                    SizedBox(width: 50,),
                  ],
                ),
            SizedBox(width: 80,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context)=> const artchoice(),));
                                               
                      },
                      child: Text("Continue", style: TextStyle(fontSize: 25.0),
                      ),
                      )
                  ],
                ),



          ],

       ),
    );
  }
}
