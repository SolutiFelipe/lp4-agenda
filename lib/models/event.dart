import 'package:first_project/models/person.dart';

class Event {

  String name;
  String data;
  String latitude;
  String longitude;
  String time;

  Event({this.name, this.data, this.latitude, this.longitude, this.time});

  @override
  String toString() {
    return 'Event{name: $name, data: $data, latitude: $latitude, time: $time}';
  }

}