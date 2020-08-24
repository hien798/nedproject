import 'dart:ui';

import 'package:nedproject/localizations/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalizationsEN implements AppLocalizations {
  const AppLocalizationsEN();

  static Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(const AppLocalizationsEN());
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationDelegate();

  @override
  String get appName => 'B13 Flutter';

  @override
  String get userSignIn => 'SignIn';

  @override
  String get userSignInFormEmail => 'Email address';

  @override
  String get userSignInFormPassword => 'Password';

  @override
  String get userSignInFormSignIn => 'Login';

  @override
  String get userSignInCreateAccount => 'Need new? Create a account';

  @override
  String get userForgottenPassword => 'Forgotten password?';

  @override
  String get userSignUpFormRegister => 'Register';

  @override
  String get userSignUpFormRetypePassword => 'Retype password';
}
