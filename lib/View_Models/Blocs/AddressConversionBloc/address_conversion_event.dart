part of 'address_conversion_bloc.dart';

@immutable
sealed class AddressConversionEvent {
  const AddressConversionEvent();
}

class FetchConvertedAddress extends AddressConversionEvent {
  final Position position;

  const FetchConvertedAddress({required this.position});
}
