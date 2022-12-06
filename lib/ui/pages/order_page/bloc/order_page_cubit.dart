import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_page_state.dart';

class OrderPageCubit extends Cubit<OrderPageState> {
  OrderPageCubit() : super(OrderPageInitial());
}
