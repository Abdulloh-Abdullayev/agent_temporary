part of 'add_outlets_cubit.dart';

class AddOutletsState extends Equatable {
  final List<XFile> images;
  final bool loading;
  final bool hasError;
  final bool reload;

  const AddOutletsState({
    this.images = const [],
    this.loading = false,
    this.hasError = true,
    this.reload = false,
  });

  AddOutletsState copyWith({
    List<XFile>? images,
    bool? loading,
    bool? hasError,
  }) {
    return AddOutletsState(
      loading: loading ?? this.loading,
      reload: !reload,
      hasError: hasError ?? this.hasError,
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        hasError,
        reload,
        images,
      ];
}
