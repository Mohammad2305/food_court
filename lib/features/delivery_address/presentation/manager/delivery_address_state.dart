part of 'delivery_address_cubit.dart';

@immutable
sealed class DeliveryAddressState {}

final class DeliveryAddressInitial extends DeliveryAddressState {}
final class SelectDifferentValueState extends DeliveryAddressState {}
