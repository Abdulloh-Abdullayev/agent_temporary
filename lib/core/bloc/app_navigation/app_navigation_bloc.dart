import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_navigation_event.dart';

part 'app_navigation_state.dart';

class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  AppNavigationBloc()
      : super(const AppNavigationState(
          appNavigationType: AppNavigationType.SEARCH,
        )) {
    on<AppNavigationChanged>((event, emit) {
      emit(
        AppNavigationState(
          appNavigationType: event.appNavigationType,
        ),
      );
    });
  }
}
