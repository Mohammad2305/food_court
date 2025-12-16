part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}
final class ChangeIndexState extends OrdersState {}

final class SelectDifferentValueState extends OrdersState {}
