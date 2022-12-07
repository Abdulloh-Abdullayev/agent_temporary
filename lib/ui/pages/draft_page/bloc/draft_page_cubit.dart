import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'draft_page_state.dart';

class DraftPageCubit extends Cubit<DraftPageState> {
  DraftPageCubit() : super(DraftPageInitial());
}
