import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/auth/auth_service.dart';
import 'package:flutter_chat_balcoder/ui/auth/login_form_page.dart';
import 'package:flutter_chat_balcoder/ui/auth/model/user_model.dart';
import 'package:flutter_chat_balcoder/ui/home/home_page.dart';

class RootPage extends StatefulWidget {
  RootPage({this.authService});

  final AuthService authService;

  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  UserModel _userModel = new UserModel();

  @override
  void initState() {
    super.initState();
    _onLoggedIn();
  }

  _onLoggedIn() {
    widget.authService.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          print(user.toString());
          _userModel = new UserModel(
            email: user.email,
            uid: user.uid,
          );

          authStatus = AuthStatus.LOGGED_IN;
        } else {
          authStatus = AuthStatus.NOT_LOGGED_IN;
        }
      });
    });
  }

  void _onSignedOut() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userModel = new UserModel();
       new AuthService().singOut();
    });
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
        body: Container(
            alignment: Alignment.center, child: CircularProgressIndicator()));
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return _buildWaitingScreen();
        break;

      case AuthStatus.NOT_LOGGED_IN:
        return new LoginFormPage(
            authService: widget.authService, onLoggedIn: _onLoggedIn);

        break;
      case AuthStatus.LOGGED_IN:
        return new HomePage(
          userModel: _userModel,
          onsingOut: _onSignedOut,
        );
        break;
      default:
        return _buildWaitingScreen();
    }
  }
}
