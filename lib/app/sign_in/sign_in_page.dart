import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker/app/sign_in/sign_in_bloc.dart';
import 'package:time_tracker/app/sign_in/sign_in_button.dart';
import 'package:time_tracker/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker/common_widgets/show_exception_alert_dialog.dart';
import 'package:time_tracker/services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.bloc}) : super(key: key);
  final SignInBloc bloc;

  // alt + ent --> convert to stateful widget
  static Widget create(BuildContext context) {
    // static is defined so that SignInBlock is only ever useful when we use it
    // together with the SignInPage
    // more maintainable code, better separation of concerns and better APIs
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(),
      child: Consumer<SignInBloc>( // choose Consume on a case-by-case basis
        // to optimise for less boilerplate code
        builder: (_, bloc, __) => SignInPage(bloc: bloc),
      ),
    );
    // _ for arguments that are not needed
  }

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(
      context,
      title: 'Sign in failed',
      exception: exception,
    );
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      bloc.setIsLoading(true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      // good practice to asynchronous apis
      await auth
          .signInAnonymously(); // since it returns a Future (see doc), add await and async. it is good practice to add Future <void>
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {
      bloc.setIsLoading(false);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      bloc.setIsLoading(true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      // good practice to asynchronous apis
      await auth
          .signInWithGoogle(); // since it returns a Future (see doc), add await and async. it is good practice to add Future <void>
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {
      bloc.setIsLoading(false);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      bloc.setIsLoading(true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      // good practice to asynchronous apis
      await auth
          .signInWithFacebook(); // since it returns a Future (see doc), add await and async. it is good practice to add Future <void>
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {
      bloc.setIsLoading(false);
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
        centerTitle: true,
      ),
      body: StreamBuilder<bool>(
          // wrap with stream builder, but not the entire
          // Scaffold because only reloads the body, not the AppBar
          stream: bloc.isLoadingStream,
          initialData: false,
          builder: (context, snapshot) {
            // snapshot variables: connectionState, hasError / error, hadData / data
            return _buildContent(context, snapshot.data);
          }),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context, bool isLoading) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
            child: _buildHeader(isLoading),
          ),
          SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: isLoading ? null : () => _signInWithGoogle(context),
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: isLoading ? null : () => _signInWithFacebook(context),
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: isLoading ? null : () => _signInWithEmail(context),
          ),
          SizedBox(height: 8.0),
          Text(
            'or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: isLoading ? null : () => _signInAnonymously(context),
            // if it'd take arguments, then'd be () => _signInAnonymously()
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isLoading) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Sign in',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
    );
  }
}
