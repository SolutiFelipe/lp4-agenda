import 'package:first_project/screens/dashboard.dart';
import 'package:first_project/screens/lista_pessoas.dart';
import 'package:flutter/material.dart';

void main() => runApp(AgendaApp());

class AgendaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        accentColor: Colors.indigo,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple,
          textTheme: ButtonTextTheme.primary
        ),
      ),
      home: Scaffold(
        body: Dashboard(),
      ),
    );
  }
}