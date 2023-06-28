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
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const artchoice(),
          ));
        },
        child: Material(
          color: const Color.fromARGB(255, 248, 248, 250),
          elevation: 5.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 110,
                      width: 350,
                      padding: const EdgeInsets.all(0.0),
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
      backgroundColor: const Color(0xffeaeaea),
      body: ListView(
        children: <Widget>[
          customcard("cuestionario", images[0]),
          customcard("", images[1]),
          customcard("", images[2]),
          customcard("", images[3]),
          customcard("", images[4]),
        ],
      ),
    );
  }
}
