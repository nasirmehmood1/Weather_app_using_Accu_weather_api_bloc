part of 'user_current_location_bloc.dart';

@immutable
sealed class UserCurrentLocationEvent {
  const UserCurrentLocationEvent();
}

@immutable
class FetchUserCurrentLocationEvent extends UserCurrentLocationEvent {
  final BuildContext context;
  const FetchUserCurrentLocationEvent({required this.context});
}
