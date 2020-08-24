part of core.blocs.user;

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent([List props = const []]) : super(props);
}

class LoadUserEvent extends UserEvent {
  @override
  String toString() => 'Load User';
}

class SignInEvent extends UserEvent {
  final LoginUser user;

  SignInEvent(this.user) : super([user]);

  @override
  String toString() => 'SignInEvent: [user: $user]';
}

class ClearUserDataEvent extends UserEvent {}