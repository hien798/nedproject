import 'package:nedproject/features/login/screen/sign_in.dart';
import 'package:nedproject/localizations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/blocs/user/bloc.dart';

class Layout extends StatefulWidget {
  final Widget bottomNavigationBar;
  final Widget child;
  final Drawer drawer;

  Layout({
    this.bottomNavigationBar,
    this.drawer,
    this.child,
  });

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  UserBloc _userBloc;

  @override
  void initState() {
    _userBloc = BlocProvider.of<UserBloc>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return BlocBuilder(
      bloc: _userBloc,
      builder: (BuildContext context, UserState state){
        return Scaffold(
          drawer: widget.drawer,
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: <Widget>[
              if(state is !UserLoaded)
                RawMaterialButton(
                  child: Text('SignIN'),
                  constraints: const BoxConstraints(minWidth: 28.0, minHeight: 36.0),
                  padding: const EdgeInsets.all(3),
                  onPressed: _navigateTo(context, SignInScreen.route),
                ),
            ],
            title: SizedBox(
              width: 300,
              child: Text(
                'B13 Flutter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
          body: widget.child,
          bottomNavigationBar: widget.bottomNavigationBar,
        );
      },
    );
  }

  void Function() _navigateTo(BuildContext context, String route){
    return () {
      Navigator.of(context).pushNamedAndRemoveUntil(route, (Route route) {
        return route.isFirst;
      });
    };
  }
}
