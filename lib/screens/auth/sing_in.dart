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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/sing.png'),
              ),
              RaisedButton(
                child: Text("Sing In"),
                onPressed: () async {
                  User user = await _auth.singInAnon();
                  if(user == null) {
                    print("error ao logar");
                  } else {
                    print("Logado");
                    print(user);
                  }
                },
              )
            ],
          ),
        ));
  }
}
