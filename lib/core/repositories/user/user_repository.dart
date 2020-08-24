import 'package:nedproject/api.dart';
import 'package:nedproject/data/api/model/login_user.dart';
import 'package:nedproject/data/api/model/request/login_user_request.dart';
import 'package:nedproject/data/api/user_and_authentication_api.dart';
import 'package:nedproject/data/models/user.dart';
import 'package:nedproject/data/shared_preference/user_shared_preference.dart';
import 'package:nedproject/shared/helpers/event_emitter.dart';

class UserRepository extends EventEmitter {
  final AppApi api;
  final UserAndAuthenticationApi userApi;
  final UserSharedPreference userStorage;

  UserRepository({
    this.api,
    this.userApi,
    this.userStorage,
  });

  Future<User> getCurrentUser() async {
    final result = await userApi.getCurrentUser();
    return result.user;
  }

  Future<User> login(LoginUser user) async {
    final result = await userApi.login(LoginUserRequest(user: user));
    return result.user;
  }

  Future<void> setAccessToken(String accessToken) async {
    await userStorage.setToken(accessToken);
  }

  Future<String> getAccessToken() async {
    final token = userStorage.token;

    if (token == null) return null;

    return token;
  }

  Future<bool> isAuthenticated() async {
    final token = await getAccessToken();

    return token != null;
  }

  Future<void> removeAccessToken() async {
    api.setApiKey('Token', null);

    return userStorage.setToken(null);
  }
}
