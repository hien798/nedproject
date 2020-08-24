import 'package:nedproject/data/api/model/request/login_user_request.dart';
import 'package:nedproject/data/api/model/response/user_response.dart';
import 'package:nedproject/data/api/user_and_authentication_api.dart';
import 'package:nedproject/data/models/user.dart';
import 'package:http/io_client.dart';

import 'package:nedproject/data/api/interceptors/auth_interceptor.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

final _jsonJaguarRepo = JsonRepo()
  ..add(UserSerializer())
  ..add(UserResponseSerializer())
  ..add(LoginUserRequestSerializer());

final Map<String, CodecRepo> defaultConverters = {
  MimeTypes.json: _jsonJaguarRepo,
};

class AppApi {
  String basePath = 'localhost:8080/api';
  Route _baseRoute;
  final Duration timeout;
  final authInterceptor = AuthInterceptor();

  AppApi({
    String baseUrl,
    List<Interceptor> interceptors,
    this.timeout = const Duration(minutes: 2),
  }) {
    _baseRoute = Route(baseUrl ?? basePath)
        .withClient(globalClient ?? IOClient()) as Route;

    _baseRoute.before(authInterceptor.before).after(authInterceptor.after);

    for (var interceptor in interceptors) {
      _baseRoute.before(interceptor.before).after(interceptor.after);
    }
  }

  void setApiKey(String name, String apiKey) {
    authInterceptor.apiKey = apiKey;
  }

  void removeApiKey(String name) {
    authInterceptor.apiKey = null;
  }

  UserAndAuthenticationApi getUserAndAuthenticationApi(
      {Route base, Map<String, CodecRepo> converters}) {
    base ??= _baseRoute;
    converters ??= defaultConverters;
    return UserAndAuthenticationApi(
        base: base, converters: converters, timeout: timeout);
  }
}
