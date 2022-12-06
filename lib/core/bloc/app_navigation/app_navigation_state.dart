part of 'app_navigation_bloc.dart';

enum AppNavigationType { MAIN, VISITS, REPORT, DRAFT, POINTS }

class AppNavigationState extends Equatable {
  const AppNavigationState({
    required this.appNavigationType,
  });

  final AppNavigationType appNavigationType;

  @override
  List<Object> get props => [appNavigationType];
}
