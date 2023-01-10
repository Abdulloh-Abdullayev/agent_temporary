import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'orders_page_state.dart';

class OrdersPageCubit extends Cubit<OrdersPageState> {
  OrdersPageCubit() : super(OrdersPageInitial());
}
