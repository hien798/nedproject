import 'package:nedproject/app.dart';
import 'package:nedproject/application.dart';
import 'package:nedproject/core/blocs/auth/bloc.dart';
import 'package:nedproject/core/blocs/user/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();

  final application = Application();
  await application.setup();
  await application.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>.value(value: application.authBloc),
        BlocProvider<UserBloc>.value(value: application.userBloc),
      ],
      child: MainApp(application: application),
    )
  );

}
