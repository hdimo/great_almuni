class UserState {}

class UserStateConnected extends UserState {}

class UserStateLoading extends UserState {}

class UserStateError extends UserState {
  String message;
  UserStateError(this.message);
}
