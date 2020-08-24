import 'package:nedproject/core/blocs/user/bloc.dart';
import 'package:nedproject/core/theme/color_palette.dart';
import 'package:nedproject/data/api/model/login_user.dart';
import 'package:nedproject/features/home/screen/home.dart';
import 'package:nedproject/features/login/screen/sign_up.dart';
import 'package:nedproject/localizations/app_localizations.dart';
import 'package:nedproject/shared/widgets/error_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _data = LoginUser();
  UserBloc _userBloc;
  LoginUserValidator _validator;

  @override
  void initState() {
    super.initState();
    _validator = LoginUserValidator();
    _userBloc = BlocProvider.of<UserBloc>(context)..add(ClearUserDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return BlocListener<UserBloc, UserState>(
      listener: (BuildContext context, UserState state) {
        if (state is UserLoaded) {
          // Navigator.of(context).pushReplacementNamed(routeName)
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, UserState state) {
          if (state is UserLoaded || state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          String error;
          if (state is UserError) {
            error = state.errors.join('\n\n');
          }
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                if (error != null)
                  ErrorContainer(
                    error: error,
                  ),
                Text(
                  'Sign In',
                  style: theme.textTheme.title.copyWith(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.violetPinkColor,
                  ),
                ),
                const SizedBox(height: 48),
                TextFormField(
                  autovalidate: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validator.validateEmail,
                  maxLength: 30,
                  style: theme.textTheme.body1.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.violetPinkColor),
                  decoration: InputDecoration(
                    hintText: locale.userSignInFormEmail,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onSaved: (value) {},
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autovalidate: false,
                  keyboardType: TextInputType.visiblePassword,
                  validator: _validator.validatePassword,
                  maxLength: 30,
                  obscureText: true,
                  style: theme.textTheme.body1.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.violetPinkColor),
                  decoration: InputDecoration(
                    hintText: locale.userSignInFormPassword,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onSaved: (value) {},
                ),
                const SizedBox(height: 76),
                const SizedBox(height: 48),
                Container(
                  height: 54,
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      locale.userSignInFormSignIn,
                      style: theme.textTheme.body1.copyWith(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: _signIn,
                    color: ColorPalette.redGreenColor,
                    elevation: 0,
                  ),
                ),
                const SizedBox(height: 48),
                InkWell(
                  onTap: () {},
                  child: Text(
                    locale.userForgottenPassword,
                    style: theme.textTheme.body2.copyWith(
                      fontSize: 15,
                      color: ColorPalette.violetPinkColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(SignUpScreen.route);
                  },
                  child: Text(
                    locale.userSignInCreateAccount,
                    style: theme.textTheme.body2.copyWith(
                      fontSize: 15,
                      color: ColorPalette.violetPinkColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _signIn() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

//      _userBloc.add(SignInEvent(_data));
    }
    Navigator.of(context).pushReplacementNamed(HomeScreen.route);
  }
}
