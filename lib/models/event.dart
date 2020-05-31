import 'package:first_project/models/person.dart';

class Event {

  String name;
  String data;
  String localizacao;
  String time;

  Event({this.name, this.data, this.localizacao, this.time});

  @override
  String toString() {
    return 'Event{name: $name, data: $data, localizacao: $localizacao, time: $time}';
  }

}