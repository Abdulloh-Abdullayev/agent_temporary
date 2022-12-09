import 'package:agent/core/models/user_model.dart';
import 'package:equatable/equatable.dart';

class DebtorsState extends Equatable {
  Region? region;
  final bool reload;
  final bool? isAllSelectedRegion;
  final bool isLoading;
  final bool hasError;
  final bool openRegion;
  final List<Region> regionFilterList;

  DebtorsState({
    this.isLoading = false,
    this.hasError = false,
    this.region,
    this.reload = false,
    this.isAllSelectedRegion = false,
    this.regionFilterList = const [],
    this.openRegion = false,
  });

  DebtorsState copyWith({
    List<Region>? regionFilterList,
    Region? region,
    bool? isAllSelectedRegion,
    bool? isLoading,
    bool? hasError,
    bool? openRegion,
  }) {
    return DebtorsState(
      isLoading: isLoading ?? this.isLoading,
      reload: !reload,
      isAllSelectedRegion:
      isAllSelectedRegion ?? this.isAllSelectedRegion,
      regionFilterList: regionFilterList ?? this.regionFilterList,
      openRegion: openRegion ?? this.openRegion,
    );
  }

  @override
  List<Object?> get props => [
    region,
    reload,
    isAllSelectedRegion,
    isLoading,
    hasError,
    regionFilterList,
    openRegion,
  ];

}
