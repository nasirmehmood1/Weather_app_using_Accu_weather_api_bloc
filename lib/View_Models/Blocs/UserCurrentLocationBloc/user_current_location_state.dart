part of 'user_current_location_bloc.dart';

@immutable
sealed class UserCurrentLocationState {
  const UserCurrentLocationState();
}

@immutable
final class UserCurrentLocationInitialState extends UserCurrentLocationState {}

@immutable
class UserCurrentLocationLoadingState extends UserCurrentLocationState {}

@immutable
class UserCurrentLocationLoadedState extends UserCurrentLocationState {
  final Position currentPosition;
  const UserCurrentLocationLoadedState({required this.currentPosition});
}

@immutable
class UserCurrentLocationErrorState extends UserCurrentLocationState {}
