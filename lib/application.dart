import 'package:nedproject/api.dart';
import 'package:nedproject/core/blocs/auth/bloc.dart';
import 'package:nedproject/core/blocs/user/bloc.dart';
import 'package:nedproject/core/repositories/user/user_repository.dart';
import 'package:nedproject/data/api/interceptors/log_interceptor.dart';
import 'package:nedproject/data/shared_preference/user_shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Config {}

class Application {
  UserRepository userRepository;
  Config config;
  AuthBloc authBloc;
  UserBloc userBloc;

  AppApi _api;

  Application({this.config});

  Future<void> setup() async {
    _api = AppApi(interceptors: [
      LogInterceptor(),
    ]);
    await setupRepositories();

    final accessToken = await userRepository.getAccessToken();
    var isAuthenticated = false;
    if (accessToken != null) {
      try {
        _api.setApiKey('Token', accessToken);
        await userRepository.getCurrentUser();

        isAuthenticated = true;
      } catch (error) {
        await userRepository.removeAccessToken();
      }
    }

    setupBlocs(isAuthenticated: isAuthenticated);
  }

  Future<void> setupRepositories() async {
    final sharePreferences = await SharedPreferences.getInstance();
    final userApi = _api.getUserAndAuthenticationApi();
    final userStorage = UserSharedPreference(sharePreferences);

    userRepository =
        UserRepository(api: _api, userApi: userApi, userStorage: userStorage);
  }

  void setupBlocs({bool isAuthenticated}) {
    authBloc = AuthBloc(
        initialState: isAuthenticated ? Authenticated() : NotAuthenticated(),
        userRepository: userRepository);

    userBloc = UserBloc(userRepository: userRepository, authBloc: authBloc);
  }

  Future<void> init() async {
    if (await userRepository.isAuthenticated()) {
      userBloc.add(LoadUserEvent());
    }
  }

  void close() {
    authBloc.close();
  }
}
