part of 'address_conversion_bloc.dart';

@immutable
sealed class AddressConversionState {
  const AddressConversionState();
}

@immutable
final class AddressConversionInitialState extends AddressConversionState {}

@immutable
final class AddressConversionLoadingState extends AddressConversionState {}

@immutable
final class AddressConversionLoadedState extends AddressConversionState {
  final List<Placemark> placemarks;

  const AddressConversionLoadedState({required this.placemarks});
}

@immutable
final class AddressConversionErrorState extends AddressConversionState {}
