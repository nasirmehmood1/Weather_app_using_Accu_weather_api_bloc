import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;

part 'user_current_location_event.dart';
part 'user_current_location_state.dart';

class UserCurrentLocationBloc
    extends Bloc<UserCurrentLocationEvent, UserCurrentLocationState> {
  UserCurrentLocationBloc() : super(UserCurrentLocationInitialState()) {
    on<FetchUserCurrentLocationEvent>(_mapUserCurrentLocationEventToStates);
  }

  FutureOr<void> _mapUserCurrentLocationEventToStates(
      FetchUserCurrentLocationEvent event,
      Emitter<UserCurrentLocationState> emit) async {
    try {
      emit(UserCurrentLocationLoadingState());
      Position currentPosition =
          await _determinePosition(context: event.context);

      // developer.log("address is ..... $currentPosition");

      emit(UserCurrentLocationLoadedState(currentPosition: currentPosition));
    } catch (e) {
      // developer.log("Error is ............ ${e.toString()}");
      emit(UserCurrentLocationErrorState());
    }
  }
}

// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition({required BuildContext context}) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    developer.log("Turn on Location");
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Turn on Location")));
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}
