import 'package:nedproject/features/login/screen/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class FlashScreen extends StatefulWidget {
  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<FlashScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.of(context).pushReplacementNamed(SignInScreen.route);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.primaryColor,
        body: Center(
          child: Text(
            'Flash Screen',
            style: TextStyle(fontSize: 80, color: Colors.yellow),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
