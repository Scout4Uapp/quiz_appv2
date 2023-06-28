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
        title: const Text("Resultados",), 
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(94, 22, 119, 1),
        toolbarHeight: 70,
        
      ),
      body: Column(
        children: <Widget>[
          const Center(
            child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Center( child: Text("SCOUT4U",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                ),
          ),
          const Center(
            child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(child: Text("¡Hazlo genial!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )),
          ),

          const SizedBox(height: 40,),
          Container(
            child: Column(
              children: <Widget>[
              Material(
                child: Container(
                  width: 250.0,
                  height: 120.0,
                child: ClipRect(
                  child: Image (image: AssetImage(image
                  ),
                  ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(
                vertical: 10.0,
              horizontal: 10.0
              )),

              Center(
                child: Text(message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22.0),),
              )
            ]),
          ),

          const Center(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(child: Text("", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:const [
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
                    Text("Mi Registro", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900, color: Color.fromRGBO(94, 22, 119, 1)),),
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
            
            const SizedBox(width: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children:[
                    const SizedBox(width: 50,height: 50,),
                    const Text("Ganados",style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Color.fromARGB(255, 0, 2, 0))),
                    Text(marks.toString(),style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Color.fromARGB(255, 13, 96, 219)),),
                    const Text("Perdidos",style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Color.fromARGB(255, 0, 2, 0))),
                    Text((100-marks).toString(),style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 20, color: Colors.red),),
                    const SizedBox(width: 50,),
                  ],
                ),
            const SizedBox(width: 80,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context)=> const artchoice(),));
                                               
                      },
                      child: const Text("Regresar", style: TextStyle(fontSize: 25.0),
                      ),
                      )
                  ],
                ),



          ],

       ),
    );
  }
}
