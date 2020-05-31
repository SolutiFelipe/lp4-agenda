import 'package:first_project/models/event.dart';
import 'package:first_project/screens/event/form_event.dart';
import 'package:first_project/screens/event/list_event_stream.dart';
import 'package:first_project/services/database_service_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListEventState();

}

class _ListEventState extends State<ListEvent> {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Event>>.value(
      value: DatabaseServiceEvent().events,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Agenda"),
          ),
          body: ListEventStream(),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormEvent();
                }));
              },
              child: const Icon(Icons.add)
          ),
        ),
    );
  }

}