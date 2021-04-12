import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {

  User get currentUser;
  Future<User> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase{

  final _firebaseAuth = FirebaseAuth.instance;

  User get currentUser => FirebaseAuth.instance.currentUser;

  Future<User> signInAnonymously() async {
     final userCredential = await _firebaseAuth.signInAnonymously();
     return userCredential.user;
  }

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

}