import 'package:nedproject/features/login/widget/signin_form.dart';
import 'package:nedproject/shared/widgets/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInScreen extends StatelessWidget {
  static const String route = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ScrollPage(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: SignInForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
