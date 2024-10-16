class HomeEvent {
  const HomeEvent();
}

class AddDataEvent extends HomeEvent {
  final String name;
  const AddDataEvent(this.name) : super();
}
