part of core.blocs.user;

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;
  StreamSubscription _authBlocSubscription;

  UserBloc({
    this.userRepository,
    this.authBloc,
  }) {
    _authBlocSubscription = authBloc.listen((state) {
      if (state is NotAuthenticated) {
        add(ClearUserDataEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _authBlocSubscription.cancel();
    return super.close();
  }

  @override
  UserState get initialState => UserUninitialized();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoadUserEvent) {
      yield* _loadUser(event);
    } else if (event is SignInEvent) {
      yield* _signInUser(event);
    } else if (event is ClearUserDataEvent) {
      yield* _clearUser(event);
    }
  }

  Stream<UserState> _loadUser(LoadUserEvent event) async* {
    try {
      yield UserLoading();
      final user = await userRepository.getCurrentUser();

      yield UserLoaded(user);
    } catch (error) {
      yield UserError(_parseError(error));
    }
  }

  Stream<UserState> _signInUser(SignInEvent event) async* {
    try {
      yield UserSigningIn();
      final user = await userRepository.login(event.user);

      authBloc.add(SignedInEvent(accessToken: user.token));
      yield UserLoaded(user);
    } catch (error) {
      yield UserError(_parseError(error));
    }
  }

  Stream<UserState> _clearUser(ClearUserDataEvent event) async* {
    yield UserUninitialized();
  }

  List<String> _parseError(Object error) {
    if (error is StringResponse) {
      try {
        final body = jsonDecode(error.body) as Map<String, dynamic>;

        final errors = <String>[];
        if (body['errors'] != null) {
          for (var entry in (body['errors'] as Map<String, dynamic>).entries) {
            errors.add('${entry.key} ${entry.value.join(', ')}');
          }
        }

        return errors;
      } catch (e) {
        print(e);
      }
    }

    return [error.toString()];
  }
}
