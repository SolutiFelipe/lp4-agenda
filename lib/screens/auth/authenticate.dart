import 'package:first_project/screens/auth/sing_in.dart';
import 'package:flutter/cupertino.dart';

class Authenticate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SingIn(),
    );
  }
}
