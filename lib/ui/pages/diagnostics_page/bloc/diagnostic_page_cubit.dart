import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'diagnostic_page_state.dart';

class DiagnosticPageCubit extends Cubit<DiagnosticPageState> {
  DiagnosticPageCubit() : super(DiagnosticPageInitial());
}
