import 'package:agent/core/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class DebtorsEvent extends Equatable {
  const DebtorsEvent();

  @override
  List<Object> get props => [];
}

class FilterLoad extends DebtorsEvent {
  @override
  List<Object> get props => [];
}

class PayslipsFilterRegionChanged extends DebtorsEvent {
  final Region region;

  @override
  List<Object> get props => [region];

  const PayslipsFilterRegionChanged({required this.region});
}

class DebtorsFilterSubmitted extends DebtorsEvent {
  @override
  List<Object> get props => [];
}

class FilterOpenRegion extends DebtorsEvent {
  final bool openRegion;

  const FilterOpenRegion(this.openRegion);

  @override
  List<Object> get props => [openRegion];
}

class CheckRegion extends DebtorsEvent {
  final int regionId;

  const CheckRegion(this.regionId);

  @override
  List<Object> get props => [regionId];
}

class SelectAllRegion extends DebtorsEvent {
  const SelectAllRegion();

  @override
  List<Object> get props => [];
}

class Refreshed extends DebtorsEvent {
  const Refreshed();

  @override
  List<Object> get props => [];
}

class FilterBySelects extends DebtorsEvent {
  const FilterBySelects();

  @override
  List<Object> get props => [];
}
