import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quiz_app/accueil.dart';
import 'package:quiz_app/result.dart';

// ignore: camel_case_types
class getjason extends StatelessWidget {
  const getjason({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/quiz.json"),
        builder: (context, snapshot) {
          List mydata = json.decode(snapshot.data.toString());

          if (mydata == null) {
            return const Scaffold(
              body: Center(child: Text("Loading...")),
            );
          } else {
            return quiz(
              mydata: mydata,
              marks: 0,
              vie: 0,
              level: 0,
              uid: '',
            );
          }
        });
  }
}

// ignore: camel_case_types
class quiz extends StatefulWidget {
  final String uid;
  var mydata;
  int marks;
  int vie;
  int level;

  quiz(
      {Key? key,
      this.mydata,
      required this.marks,
      required this.level,
      required this.vie,
      required this.uid})
      : super(key: key);

  @override
  _quizState createState() => _quizState(mydata, marks, vie, level, uid);
}

// ignore: camel_case_types
class _quizState extends State<quiz> {
  String message = "score" + "0 " + "-" + "Best" + "0";
  String levels = "level " + "0" + "/21";
  String vies = "5";

  final String uid;
  var mydata;
  int marks = 0;
  int vie = 5;
  int level = 0;

  _quizState(this.mydata, int marks, int level, int vie, this.uid);

  Color ch = Colors.indigo;
  Color rig = Colors.green;
  Color wro = Colors.red;

  int i = 1;
  int timer = 30;
  int click = 20;
  String showtimer = "30";

  Map<String, Color> btncolor = {
    "a": const Color.fromRGBO(94, 22, 119, 100),
    "b": const Color.fromRGBO(94, 22, 119, 100),
    "c": const Color.fromRGBO(94, 22, 119, 100),
    "d": const Color.fromRGBO(94, 22, 119, 100),
  };
  bool canceltimer = false;
  int g = 0;
// comentariado eliminando 81 errores}

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    click = 20;
    canceltimer = false;
    timer = 30;
    setState(() {
      if (i < 20) {
        level++;
        levels = 'level :' + "$level" + "/20";
        i++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => result(marks: marks),
        ));
      }
      btncolor["a"] = const Color.fromRGBO(94, 22, 119, 1);
      btncolor["b"] = const Color.fromRGBO(94, 22, 119, 1);
      btncolor["c"] = const Color.fromRGBO(94, 22, 119, 1);
      btncolor["d"] = const Color.fromRGBO(94, 22, 119, 1);
    });
    starttimer();
  }

  void quit() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => result(marks: marks),
    ));
  }

  void checkanswer(String k) async {
    if (click == 20) {
      if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
        marks = marks + 5;
        message = "Score " + "$marks" + "-" + " Best " + g.toString();
        ch = rig;
      } else {
        ch = wro;
        vie = vie - 1;
        vies = "$vie";
      }
      setState(() {
        btncolor[k] = ch;
        if (k != "a" &&
            mydata[2][i.toString()] == mydata[1][i.toString()]["a"]) {
          btncolor["a"] = rig;
        }
        if (k != "b" &&
            mydata[2][i.toString()] == mydata[1][i.toString()]["b"]) {
          btncolor["b"] = rig;
        }
        if (k != "c" &&
            mydata[2][i.toString()] == mydata[1][i.toString()]["c"]) {
          btncolor["c"] = rig;
        }
        if (k != "d" &&
            mydata[2][i.toString()] == mydata[1][i.toString()]["d"]) {
          btncolor["d"] = rig;
        }
        canceltimer = true;
      });
      click = 30;
      if (vie > 0) {
        Timer(const Duration(seconds: 2), nextquestion);
      } else {
        Timer(const Duration(seconds: 2), quit);
      }
    }
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      child: MaterialButton(
        onPressed: () => {checkanswer(k)},
        child: Text(
          mydata[1][i.toString()][k],
          
          style: const TextStyle(
              fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 400.0,
        height:45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const accueil(),
              ));
            },
          ),
          title: const Text("ARsT QUICK QUIZ"),
          backgroundColor:  Color.fromRGBO(94, 22, 119, 1),            
          actions: [
            Text(
              vies,
              style: const TextStyle(
                  height: 2, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.deepOrange,
              ),
              onPressed: () {},
            )
          ],
          toolbarHeight: 70.0,
          centerTitle: true,
  
        ),
        body: Scrollbar(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1.0),
                color: Color.fromARGB(255, 42, 71, 238),
                gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight)),
          
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 180,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromRGBO(94, 22, 119, 1)),
                      child: Text(
                        message,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromRGBO(94, 22, 119, 1)),
                      child: Text(
                        levels,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.indigoAccent),
                  padding: const EdgeInsets.fromLTRB(5, 1, 5, 0),
                  margin: const EdgeInsets.fromLTRB(5, 1, 5, 0),
                  alignment: Alignment.center,
                  child: Text(
                    mydata[0][i.toString()],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 0),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        choicebutton('a'),
                        choicebutton('b'),
                        choicebutton('c'),
                        choicebutton('d'),
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(0.0),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(200.0),
                    color: Colors.indigoAccent,
                    boxShadow:    [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                  ),
                  child: Center(
                    child: Text(
                      showtimer,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontFamily: "Comfortaa",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
