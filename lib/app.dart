import 'package:nedproject/application.dart';
import 'package:nedproject/core/blocs/user/bloc.dart';
import 'package:nedproject/core/repositories/user/user_repository.dart';
import 'package:nedproject/localizations/app_localizations.dart';
import 'package:nedproject/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainApp extends StatelessWidget {
  final Application application;

  const MainApp({
    this.application,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>.value(
          value: application.userRepository,
        ),
      ],
      child: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, UserState state){
          return MaterialApp(
            locale: const Locale('en', ''),
            onGenerateTitle: (BuildContext context) => AppLocalizations.of(context).appName,
            color: Colors.green,
            theme: ThemeData(
              primaryColor: Colors.green,
              fontFamily: 'WorkSans',
            ),
            localizationsDelegates: [
              const AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('en')
            ],
            onGenerateRoute: routes(application: application),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
