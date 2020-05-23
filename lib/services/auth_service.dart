import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/services/database_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  Future singInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return this._userFromFirebaseUser(user);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch(exception) {
      print(exception.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      FirebaseUser user = result.user;
      return this._userFromFirebaseUser(user);

    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future singInRegisteredUser(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      //await DatabaseService(uid: user.uid).updateDatabase("Bruce Banner", "Cientista");


      return this._userFromFirebaseUser(user);

    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future recoverPasword(String email) async {
    try{
      var result = await _auth.sendPasswordResetEmail(email: email);

    } catch(exception) {
      print(exception.toString());
      return null;
    }
  }
}
