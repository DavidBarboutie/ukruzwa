sealed class HomeState {
  const HomeState();
}

class HomeStateInitial extends HomeState {
  const HomeStateInitial() : super();
}

// class AddDataState extends HomeState {
//   final bool send;
//   const AddDataState(this.send) : super();
// }

class AuthState extends HomeState {
  final bool auth;
  const AuthState(this.auth) : super();
}

class ErrorState extends HomeState {
  final bool auth;
  const ErrorState(this.auth) : super();
}

class InscriptionState extends HomeState {
  final bool signup;
  const InscriptionState(this.signup) : super();
}
