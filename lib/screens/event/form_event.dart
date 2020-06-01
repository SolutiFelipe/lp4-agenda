import 'package:first_project/screens/util/progress.dart';
import 'package:first_project/services/database_service_event.dart';
import 'package:flutter/material.dart';

class FormEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormEventState();
}

class _FormEventState extends State<FormEvent> {
  @override
  Widget build(BuildContext context) {

    bool loading = false;

    return loading
        ? Progress()
        : Scaffold(
            appBar: AppBar(
              title: Text("Cadastro Evento"),
            ),
            body: Container(),
          );
  }
}
