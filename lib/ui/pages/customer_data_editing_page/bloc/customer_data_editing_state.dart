part of 'customer_data_editing_cubit.dart';

@immutable
abstract class CustomerDataEditingState {}

class CustomerDataEditingInitial extends CustomerDataEditingState {}

class CounterState extends CustomerDataEditingState {
  CounterState();
}
