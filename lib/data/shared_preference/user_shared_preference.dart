import 'package:nedproject/data/shared_preference/key_value_shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreference {
  static const _tokenKey = 'token';

  SharedPreferences sharedPreferences;

  UserSharedPreference(this.sharedPreferences);

  get token {
    return sharedPreferences.getString(_tokenKey);
  }

  Future<void> setToken(String authToken) async {
    await sharedPreferences.setString(_tokenKey, authToken);
  }
}
