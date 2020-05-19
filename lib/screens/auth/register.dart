import 'package:first_project/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();

}

class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar"),
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

                },
              ),
              SizedBox(
                height: 16.0,
              ),
              RaisedButton(
                child: Text("Cadastrar"),
                onPressed: () async {},
              )
            ],
          ),
        ),
      ),
    );
  }

}