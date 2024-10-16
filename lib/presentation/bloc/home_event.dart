class HomeEvent {
  const HomeEvent();
}

class AddDataEvent extends HomeEvent {
  final String name;
  const AddDataEvent(this.name) : super();
}

class AuthEvent extends HomeEvent {
  final String email;
  final String pwd;
  const AuthEvent(this.email, this.pwd) : super();
}
