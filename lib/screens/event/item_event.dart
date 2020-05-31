import 'package:first_project/models/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemEvent extends StatelessWidget {
  final Event _event;

  ItemEvent(this._event);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(this._event.name),
        subtitle: Text(this._event.data),
        leading: Icon(Icons.calendar_today),
      ),
    );
  }
}
