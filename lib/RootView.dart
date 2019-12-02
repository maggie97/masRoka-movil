import 'package:flutter/material.dart';
import 'package:mas_roca/Network/UserDefaults.dart';

import 'Network/BaseAuth.dart';
import 'home.dart';
import 'main.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class RootPage extends StatefulWidget {
  RootPage();

  final BaseAuth auth = Auth();

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    print('use');
    widget.auth.getCurrentUser().then((user) {
      print(user);
      setState(() {
        if (user != null) {
          UserDefaults.shared.userId = user?.uid;
          UserDefaults.shared.email = user.email;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        UserDefaults.shared.userId = user.uid.toString();
        UserDefaults.shared.email = user.email;
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      UserDefaults.shared.userId ="";
      UserDefaults.shared.email = "";
    });
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new MyApp(
          auth: widget.auth,
          loginCallback: loginCallback,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (UserDefaults.shared.userId.length > 0 && UserDefaults.shared.userId != null) {
          return new Menu(
            userID: UserDefaults.shared.userId,
            auth: widget.auth,
            logoutCallback: logoutCallback,
          );
        } else
          return buildWaitingScreen();
        break;
      default:
        return buildWaitingScreen();
    }
  }
}