
import 'package:first_project/screens/auth/authenticate.dart';
import 'package:first_project/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:first_project/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    /*retornar dashboard se logado ou authenticate se não logado*/
    // TODO: implement build

    if(user != null) {
      return Dashboard();
    }
    else {
      return Authenticate();
    }
  }

}