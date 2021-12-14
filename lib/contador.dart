// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:apptreinamento/home.dart';

class MyCountPage extends StatefulWidget {
  const MyCountPage({Key? key}) : super(key: key);

  @override
  _MyCountPageState createState() => _MyCountPageState();
}

class _MyCountPageState extends State<MyCountPage> {
  int count = 0;

  void incrementar() {
    setState(() {
      count++;
    });
  }

  void decrementar() {
    setState(() {
      count--;
    });
  }

  void limpar() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contador"),
          centerTitle: true,
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: Icon(Icons.arrow_back),
            ),
            FloatingActionButton(
                onPressed: () {
                  incrementar();
                },
                child: Icon(Icons.add),
                heroTag: "incrementar"),
            FloatingActionButton(
                onPressed: () {
                  decrementar();
                },
                child: Icon(Icons.remove),
                heroTag: "decrementar"),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text("Número de clicks", style: TextStyle(fontSize: 20)),
            Text('$count', style: TextStyle(fontSize: 30)),
            ElevatedButton(
                onPressed: () {
                  limpar();
                },
                child: Text("Zerar"))
          ],
        )));
  }
}
