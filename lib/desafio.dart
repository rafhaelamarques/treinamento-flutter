import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Desafio extends StatefulWidget {
  const Desafio({Key? key}) : super(key: key);

  @override
  _DesafioState createState() => _DesafioState();
}

class _DesafioState extends State<Desafio> {
  String _user = '';
  String _name = '';
  String _bio = '';
  late Image _avatar;

  final TextEditingController _gitUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Desafio"),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // CircleAvatar(radius: 80, backgroundImage: NetworkImage($_avatar)),
              Text('Usuário: $_user'),
              Text('Nome: $_name'),
              Text(
                'Bio: $_bio',
                textAlign: TextAlign.center,
              ),
              TextFormField(
                controller: _gitUser,
                decoration: InputDecoration(labelText: 'Usuário'),
              ),
              ElevatedButton(
                  onPressed: () {
                    _getGithubData(_gitUser.text);
                  },
                  child: const Text("Buscar"))
            ],
          ),
        )));
  }

  Future<void> _getGithubData(String user) async {
    final response =
        await http.get(Uri.parse('https://api.github.com/users/$user'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> dados = json.decode(response.body);
      setState(() {
        _user = dados['login'];
        _name = dados['name'];
        _bio = dados['bio'];
        // _avatar = dados['avatar'];
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Ocorreu um erro ao buscar o usuário.")));
    }
    print(response.body);
  }
}
