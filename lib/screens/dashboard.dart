import 'package:first_project/screens/database/list_person.dart';
import 'package:first_project/screens/api/list_person_api.dart';
import 'package:first_project/screens/firestore/list_person_firestore.dart';
import 'package:first_project/screens/util/menu_item.dart';
import 'package:first_project/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Dashboard extends StatelessWidget {

  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            textColor: Colors.white,
            icon: Icon(Icons.person_outline),
            label: Text("Logout"),
            onPressed:()  async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MenuItem(
                  'Contacts DB',
                  Icons.dns,
                  onClick: () => _showContactsListDB(context),
                ),
                MenuItem(
                  'Contacts API',
                  Icons.filter_drama,
                  onClick: () => _showContactsListAPI(context),
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MenuItem(
                  'Contacts Firestore',
                  Icons.backup,
                  onClick: () => _showContactsListFirestore(context),
                ),
                MenuItem(
                  'Events',
                  Icons.calendar_today,
                  onClick: () => _showEventsList(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showContactsListDB(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListPerson(),
      ),
    );
  }

  void _showContactsListAPI(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListPersonApi(),
      ),
    );
  }

  void _showContactsListFirestore(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListPersonFirestore(),
      ),
    );
  }

  void _showEventsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => null,
      ),
    );
  }
}
