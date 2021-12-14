// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:apptreinamento/contador.dart';
import 'package:apptreinamento/desafio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Treinamento Flutter"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage("https://picsum.photos/200")),
          Text("Rafhaela Marques",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyCountPage()));
              },
              child: Text("Ir para contador")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Desafio()));
              },
              child: Text("Desafio"))
        ],
      )),
    );
  }
}
// TODO Implement this library.