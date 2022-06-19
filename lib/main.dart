// ignore_for_file: unused_element, unnecessary_new

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  __MyHomePageState createState() => __MyHomePageState();
}

class __MyHomePageState extends State<_MyHomePage> {
  TextEditingController txt = TextEditingController();
  TextEditingController txt1 = TextEditingController();
  var lst = [];

  int get = 0;
  String gettext1 = "";

  String gettext = "";
  String upd1 = "";
  int get1 = 0;

  submit() {
    setState(() {
      lst.add(gettext);
      print(lst);
    });
  }

  remove() {
    setState(() {
      lst.removeAt(get);
    });
  }

 

  textFieldAlertDailogWidget(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Task"),
            content: TextField(
              decoration: InputDecoration(hintText: "Enter What ever you want"),
              controller: txt,
              onChanged: (value) {
                gettext = value;
              },
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  submit();
                  Navigator.of(context).pop();
                  txt.clear();
                },
                child: Text("Ok"),
                color: Colors.pinkAccent,
              )
            ],
          );
        });
  }

  remooveAlertDailogWidget(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Task"),
            content: TextField(
              decoration: InputDecoration(hintText: "Enter Task no."),
              controller: txt,
              onChanged: (value) {
                get = value as int;
              },
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  txt.clear();
                },
                child: Text("No"),
                color: Colors.pinkAccent,
              ),
              RaisedButton(
                onPressed: () {
                  remove();
                  Navigator.of(context).pop();
                  txt.clear();
                },
                child: Text("Yes"),
                color: Colors.pinkAccent,
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Container(
            width: 400,
            height: 600,
            child: Image.asset(
              "assets/image.png",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            child: Text(
              "Tasks",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            top: 40,
            left: 20,
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollcontianer) {
              return Stack(overflow: Overflow.visible, children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40))),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Task no. $index",
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            lst[index],
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          trailing: IconButton(
                              icon: const Icon(Icons.update,
                                  color: Colors.greenAccent),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Task"),
                                        content: TextField(
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Enter What ever you want to Update"),
                                          controller: txt1,
                                          onChanged: (value) {
                                            upd1 = value;
                                          },
                                        ),
                                        actions: [
                                          RaisedButton(
                                            onPressed: () {
                                              setState(() {
                                                lst[index] = upd1;
                                              });
                                              Navigator.of(context).pop();
                                              txt1.clear();
                                            },
                                            child: Text("Ok"),
                                            color: Colors.pinkAccent,
                                          )
                                        ],
                                      );
                                    });
                              }),
                          isThreeLine: true,
                        );
                      },
                      controller: scrollcontianer,
                      itemCount: lst.length,
                    )),
                Positioned(
                  child: FloatingActionButton(
                      child: Icon(Icons.add, color: Colors.white),
                      backgroundColor: Colors.pinkAccent,
                      onPressed: () {
                        textFieldAlertDailogWidget(context);
                      }),
                  top: -10,
                  right: 30,
                ),
                Positioned(
                  child: FloatingActionButton(
                      child: Icon(Icons.remove, color: Colors.white),
                      backgroundColor: Colors.pinkAccent,
                      onPressed: () {
                        remooveAlertDailogWidget(context);
                      }),
                  top: -10,
                  right: 100,
                ),
              ]);
            },
          )
        ]));
  }
}
