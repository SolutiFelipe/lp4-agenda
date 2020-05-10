import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;

  Editor(this._controller, this._label);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: this._controller,
      style: TextStyle(fontSize: 16.0),
      decoration: InputDecoration(labelText: this._label),
    );
  }
}