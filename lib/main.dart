import 'package:flutter/material.dart';
import 'package:flutter_app/screens/lista_pessoas.dart';

void main() => runApp(AgendaApp());

class AgendaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: ListaPessoas(),
      ),
    );
  }
}