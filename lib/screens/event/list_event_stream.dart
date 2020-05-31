import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/models/event.dart';
import 'package:first_project/models/person.dart';
import 'package:first_project/screens/event/item_event.dart';
import 'package:first_project/screens/util/item_person.dart';
import 'package:first_project/screens/util/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ListEventStream extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListEventStreamState();
}

class _ListEventStreamState extends State<ListEventStream> {
  @override
  Widget build(BuildContext context) {

    final eventos = Provider.of<List<Event>>(context);

    if (eventos == null) {
      return Progress();
    } else {
      return ListView.builder(
        itemCount: eventos.length,
        itemBuilder: (context, index) {
          Event event = eventos[index];
          return ItemEvent(event);
        },
      );
    }
  }
}
