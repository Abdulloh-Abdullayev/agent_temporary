import 'package:agent/core/models/products_model/products_model.dart';
import 'package:agent/core/services/products_servise/products_servise.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  Future<List<ProductsModel>> getProducty({required int page,required int page_size}){
    var result = ProductService().getProductsFromDb();
    return result;
  }
}
