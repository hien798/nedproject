part of core.blocs.auth;

@immutable
abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super(props);
}

class NotAuthenticated extends AuthState {}

class Authenticated extends AuthState {}

class AuthError extends AuthState {
  final Object error;

  AuthError(this.error) : super([error]);
}
