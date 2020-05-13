import 'package:first_project/models/user.dart';
import 'package:first_project/screens/auth/wrapper.dart';
import 'package:first_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        body: StreamProvider<User>.value(
            value: AuthService().user,
            child: Wrapper()
        ),
      ),
    );
  }
}