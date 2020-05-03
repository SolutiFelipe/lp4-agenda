import 'package:first_project/screens/lista_pessoas.dart';
import 'package:first_project/screens/menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Dashboard extends StatelessWidget {

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
            onPressed:()  {

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
        ],
      ),
    );
  }

  void _showContactsListDB(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListaPessoas(),
      ),
    );
  }

  void _showContactsListAPI(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(),
    );
  }
}
