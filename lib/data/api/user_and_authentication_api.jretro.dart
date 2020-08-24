// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_and_authentication_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$UserAndAuthenticationApiClient implements ApiClient {
  final String basePath = "";
  Future<UserResponse> login(LoginUserRequest body) async {
    var req = base.post
        .path(basePath)
        .path("/users/login")
        .json(jsonConverter.to(body));
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<UserResponse> getCurrentUser() async {
    var req = base.get
        .metadata({
          "auth": true,
        })
        .path(basePath)
        .path("/user");
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
