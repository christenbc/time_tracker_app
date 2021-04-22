import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';

class SignInBloc {
  SignInBloc({@required this.auth});
  final AuthBase auth;

  final StreamController<bool> _isLoadingController = StreamController<bool>();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
    // remove controller when sign in page is removed from the widget tree and
    // we do not longer need the bloc
  }

  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      _setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      rethrow; // forwarding the exception to the calling code
      _setIsLoading(false);
    }
  }

  /* Instead of repeating this code several times...
  Future<User> signInAnonymously() async {
    try {
      setIsLoading(true);
      return await auth.signInAnonymously();
    } catch {
      rethrow; // forwarding the exception to the calling code
    } finally {
      setIsLoading(false);
    }
  }
  */

  Future<User> signInAnonymously() async => await _signIn(auth.signInAnonymously);

  Future<User> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);

  Future<User> signInWithFacebook() async => await _signIn(auth.signInWithFacebook);

}
