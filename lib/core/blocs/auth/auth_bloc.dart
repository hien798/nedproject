part of core.blocs.auth;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  @override
  final AuthState initialState;

  AuthBloc({
    this.initialState,
    @required this.userRepository,
  });

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignedInEvent) {
      yield* _signedIn(event);
    } else if (event is SignOutEvent) {
      yield* _signOut(event);
    }
  }

  Stream<AuthState> _signedIn(SignedInEvent event) async* {
    try {
      await userRepository.setAccessToken(event.accessToken);
      yield Authenticated();
    } catch (error) {
      yield AuthError(error);
    }
  }

  Stream<AuthState> _signOut(SignOutEvent event) async* {
    await userRepository.removeAccessToken();

    yield NotAuthenticated();
    if (event.onComplete != null) {
      event.onComplete();
    }
  }
}
