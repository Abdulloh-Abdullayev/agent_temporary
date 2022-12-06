import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customer_data_page_state.dart';

class CustomerDataPageCubit extends Cubit<CustomerDataPageState> {
  CustomerDataPageCubit() : super(CustomerDataPageInitial());
}
