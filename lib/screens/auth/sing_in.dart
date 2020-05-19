import 'package:first_project/models/user.dart';
import 'package:first_project/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  AuthService _auth = AuthService();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {

            },
            icon: Icon(Icons.person),
            label: Text("Registrar"),
            textColor: Colors.white,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 48.0,
        ),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "E-mail:"
                ),
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Senha:"
                ),
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              RaisedButton(
                child: Text("Login"),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}