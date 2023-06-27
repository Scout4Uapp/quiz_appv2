import 'package:flutter/material.dart';
import 'package:quiz_app/artchoice.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  List<String> images = [
    "images/historia_escultismo.png",
    "images/como_iniciar.png",
    "images/nudos.png",
    "images/supervivencia.png",
    "images/Primeros_Auxilios.png",
  ];
  Widget customcard(String lang, String image) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => artchoice(),
          ));
        },
        child: Material(
          color: Color.fromARGB(255, 248, 248, 250),
          elevation: 5.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 110,
                      width: 350,
                      padding: EdgeInsets.all(0.0),
                      child: ClipOval(child: Image(image: AssetImage(image))),
                    ),
                  ),
                ),
                Center(
                  child: Text(lang),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaeaea),
      body: ListView(
        children: <Widget>[
          customcard("Quiz Numero 1.", images[0]),
          customcard("Quiz Numero 2.", images[1]),
          customcard("Quiz Numero 3.", images[2]),
          customcard("Quiz Numero 4.", images[3]),
          customcard("Quiz Numero 5.", images[4]),
        ],
      ),
    );
  }
}
