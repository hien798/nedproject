import 'package:nedproject/core/blocs/user/bloc.dart';
import 'package:nedproject/core/theme/color_palette.dart';
import 'package:nedproject/data/api/model/login_user.dart';
import 'package:nedproject/features/home/screen/home.dart';
import 'package:nedproject/features/login/screen/sign_in.dart';
import 'package:nedproject/localizations/app_localizations.dart';
import 'package:nedproject/shared/widgets/error_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
                  'Sign Up',
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
                const SizedBox(height: 48),
                Container(
                  height: 54,
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      locale.userSignUpFormRegister,
                      style: theme.textTheme.body1.copyWith(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: _signUp,
                    color: ColorPalette.redGreenColor,
                    elevation: 0,
                  ),
                ),
                const SizedBox(height: 48),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(SignInScreen.route);
                  },
                  child: Text(
                    'Cancel',
                    style: theme.textTheme.body2.copyWith(
                      fontSize: 15,
                      color: ColorPalette.violetPinkColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

//      _userBloc.add(SignInEvent(_data));
    }
    Navigator.of(context).pushReplacementNamed(HomeScreen.route);
  }
}
