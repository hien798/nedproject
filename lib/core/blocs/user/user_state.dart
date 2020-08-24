part of core.blocs.user;

@immutable
abstract class UserState extends Equatable {
  UserState([List props = const []]) : super(props);
}

class UserUninitialized extends UserState {}

class UserLoading extends UserState {}

class UserSigningIn extends UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user) : super([user]);
}

class UserError extends UserState {
  final List<String> errors;

  UserError(this.errors) : super([errors]);
}
