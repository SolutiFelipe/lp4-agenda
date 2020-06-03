import 'package:first_project/models/event.dart';
import 'package:first_project/screens/util/drop_box_people.dart';
import 'package:first_project/screens/util/progress.dart';
import 'package:first_project/services/database_service_contact.dart';
import 'package:first_project/services/database_service_event.dart';
import 'package:first_project/services/fire_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class FormEvent extends StatefulWidget {
  DateTime dateSelected;
  TimeOfDay timeSelected;
  LatLng locateSelected;
  String name;

  @override
  State<StatefulWidget> createState() => _FormEventState();
}

class _FormEventState extends State<FormEvent> {

  DatabaseServiceEvent serviceEvent = DatabaseServiceEvent();

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    final _formKey = GlobalKey<FormState>();

    return loading
        ? Progress()
        : Scaffold(
            appBar: AppBar(
              title: Text("Cadastro Evento"),
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
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          child: Icon(Icons.calendar_today),
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(20222),
                            ).then((date) {
                              setState(() => widget.dateSelected = date);
                            });
                          },
                        ),
                        Text(
                          widget.dateSelected == null
                              ? "Escolha uma data"
                              : _parseDateToString(widget.dateSelected),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          child: Icon(Icons.access_time),
                          onPressed: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((time) {
                              setState(() => widget.timeSelected = time);
                            });
                          },
                        ),
                        Text(
                          widget.timeSelected == null
                              ? "Escolha um horário"
                              : _parseTimeToString(widget.timeSelected),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    RaisedButton(
                      child: Icon(Icons.location_on),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return FireMap();
                        })).then((locate) async {
                          await setState(() => widget.locateSelected = locate);
                        });

                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    StreamProvider<List<String>>.value(
                      value: DatabaseServiceContact().contactsName,
                      child: DropBoxPeople(
                        callback: (value) {
                          setState(() => widget.name = value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    RaisedButton(
                      child: Text("Cadastrar"),
                      onPressed: () {
                        Event event = Event(
                          name: widget.name,
                          data: _parseDateToString(widget.dateSelected),
                          time: _parseTimeToString(widget.timeSelected),
                          longitude: widget.locateSelected.longitude.toString(),
                          latitude: widget.locateSelected.latitude.toString()
                        );
                        serviceEvent.updateDatabase(event);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
  }

  String _parseDateToString(DateTime date) {
    return date.day.toString() +
        "/" +
        date.month.toString() +
        "/" +
        date.year.toString();
  }

  String _parseTimeToString(TimeOfDay time) {
    return widget.timeSelected.hour.toString() +
        ":" +
        widget.timeSelected.minute.toString();
  }
}
