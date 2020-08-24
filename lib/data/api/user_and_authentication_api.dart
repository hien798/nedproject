import 'package:nedproject/data/api/model/request/login_user_request.dart';
import 'package:nedproject/data/api/model/response/user_response.dart';
import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/client/client.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user_and_authentication_api.jretro.dart';

@GenApiClient()
class UserAndAuthenticationApi extends ApiClient
    with _$UserAndAuthenticationApiClient {
  final Route base;
  @override
  final Map<String, CodecRepo> converters;
  final Duration timeout;

  UserAndAuthenticationApi({
    this.base,
    this.converters,
    this.timeout = const Duration(minutes: 2),
  });

  @PostReq(path: '/users/login')
  @override
  Future<UserResponse> login(@AsJson() LoginUserRequest body) {
    return super.login(body).timeout(timeout);
  }

  @override
  @GetReq(
    path: '/user',
    metadata: {
      'auth': true,
    },
  )
  @override
  Future<UserResponse> getCurrentUser() {
    return super.getCurrentUser().timeout(timeout);
  }
}
