import 'package:first_project/models/user.dart';
import 'package:first_project/screens/auth/register.dart';
import 'package:first_project/screens/util/progress.dart';
import 'package:first_project/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  String email = "";
  String password = "";
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return loading ? Progress() : Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Register();
              }));
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
                child: Text("Login"),
                onPressed: () async {

                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.singInRegisteredUser(email, password);

                    if(result == null) {
                      loading = false;
                      setState(() => error = "Login e senha incorretos");
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
