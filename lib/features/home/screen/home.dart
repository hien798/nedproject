import 'package:nedproject/features/login/screen/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Text('Home Page'),
          SizedBox(height: 16),
          MaterialButton(
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(SignInScreen.route);
            },
            child: Text('Go Signin'),
          )
        ],
      ),
    );
  }
}
