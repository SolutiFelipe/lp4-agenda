import 'package:first_project/models/user.dart';
import 'package:first_project/screens/auth/register.dart';
import 'package:first_project/screens/util/progress.dart';
import 'package:first_project/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecoverPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  String email = "";
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 48.0,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? "Insira o Email" : null,
                decoration: const InputDecoration(labelText: "E-mail:"),
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              RaisedButton(
                child: Text("Enviar Email"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    var result = await _auth.recoverPasword(email);
                    Navigator.pop(context);

                  }
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 8.0,
              ),
              Center(
                child: Text(
                  error,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
