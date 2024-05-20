import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import 'dart:developer' as developer;
part 'address_conversion_event.dart';
part 'address_conversion_state.dart';

class AddressConversionBloc
    extends Bloc<AddressConversionEvent, AddressConversionState> {
  AddressConversionBloc() : super(AddressConversionInitialState()) {
    on<FetchConvertedAddress>(_mapFetchConvertedAddressEventToState);
  }

  FutureOr<void> _mapFetchConvertedAddressEventToState(
      FetchConvertedAddress event, Emitter<AddressConversionState> emit) async {
    try {
      emit(AddressConversionLoadingState());

      List<Placemark> placeMarks = await placemarkFromCoordinates(
          event.position.latitude, event.position.longitude);

      emit(AddressConversionLoadedState(placemarks: placeMarks));
    } catch (e) {
      emit(AddressConversionErrorState());
    }
  }
}
