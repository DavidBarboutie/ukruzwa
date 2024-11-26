sealed class SalleSpectacleState {
  const SalleSpectacleState();
}

class SalleSpectacleStateInitial extends SalleSpectacleState {
  const SalleSpectacleStateInitial() : super();
}

class AddDataState extends SalleSpectacleState {
  final bool send;
  const AddDataState(this.send) : super();
}
