import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'act_state.dart';

class ActCubit extends Cubit<ActState> {
  ActCubit() : super(ActState(tableChildren: [], tableColumns: []));
}
