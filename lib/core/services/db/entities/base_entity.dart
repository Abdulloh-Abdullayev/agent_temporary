import 'package:equatable/equatable.dart';

abstract class BaseEntity<T> extends Equatable {}

class Book extends BaseEntity {
  @override
  List<Object?> get props => [];
}
