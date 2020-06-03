import 'package:first_project/screens/util/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropBoxPeople extends StatefulWidget {

  List<String> names = List();
  String dropDownValue = "Escolha um participante";
  Function(String) callback;

  DropBoxPeople({Key key, @required this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropBoxPeopleState();

}

class _DropBoxPeopleState extends State<DropBoxPeople> {

  @override
  Widget build(BuildContext context) {

    widget.names = Provider.of<List<String>>(context);

    if(widget.names == null) {
      return Progress();
    } else {

      if(!widget.names.contains("Escolha um participante")) {
        widget.names.insert(0, "Escolha um participante");
      }

      return DropdownButton<String>(
        value: widget.dropDownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24.0,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String valueSelected) {
          setState(() {
            widget.dropDownValue = valueSelected;
            widget.callback(widget.dropDownValue);
          });
        },
        items: widget.names.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );

    }

  }

}