import 'package:first_project/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "";
  String password = "";
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = "";

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
          key: _formKey,
          child: Column(
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
              TextFormField(
                validator: (val) => val.length < 8
                    ? "Senha deve ter no mínimo 8 caracteres"
                    : null,
                decoration: const InputDecoration(labelText: "Senha:"),
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              RaisedButton(
                child: Text("Cadastrar"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);

                    Navigator.pop(context);

                    if (result == null) {
                      setState(() => error = "Insira um email válido");
                    }
                  }
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                error,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
