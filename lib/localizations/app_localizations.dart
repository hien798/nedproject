import 'package:nedproject/localizations/app_localizations_en.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

abstract class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  String get appName;

  /// Sign in
  String get userSignIn;
  String get userSignInCreateAccount;
  String get userSignInFormEmail;
  String get userSignInFormPassword;
  String get userSignInFormSignIn;
  String get userSignUpFormRegister;
  String get userSignUpFormRetypePassword;
  String get userForgottenPassword;
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    // TODO: implement load
    final name = (locale.countryCode == null || locale.countryCode.isEmpty)
        ? locale.languageCode
        : locale.toString();
    final localName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localName;

    if(locale.languageCode == 'en') {
      return AppLocalizationsEN.load(locale);
    } else {
      // TODO: for other lang
      return AppLocalizationsEN.load(locale);
    }
  }
  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
}
