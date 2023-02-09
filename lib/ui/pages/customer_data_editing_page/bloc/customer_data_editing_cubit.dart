import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customer_data_editing_state.dart';

class CustomerDataEditingCubit extends Cubit<CustomerDataEditingState> {
  CustomerDataEditingCubit() : super(CustomerDataEditingInitial());

  int counter = 0;

  void plus() {
    counter += 1;
    emit(CounterState());
  }

  void minus() {
    counter -= 1;
    emit(CounterState());
  }
}
