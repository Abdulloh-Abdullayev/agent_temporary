part of 'left_menu_bloc.dart';

class LeftMenuState extends Equatable {
  final String? name;
  final XFile? image;
  final String? lastPas;
  final String? newPas;
  final String? repeatPas;
  final bool isLoading;
  final bool hideShow;
  final bool hasError;
  final bool reLoad;

  @override
  List<Object?> get props => [
        name,
        image,
        lastPas,
        newPas,
        repeatPas,
        isLoading,
        hasError,
        reLoad,
    hideShow,
      ];

  const LeftMenuState({
    this.name,
    this.image,
    this.lastPas,
    this.newPas,
    this.repeatPas,
    this.isLoading = false,
    this.hasError = false,
    this.reLoad = false,
    this.hideShow = false,
  });

  LeftMenuState copyWith({
    String? name,
    XFile? image,
    String? lastPas,
    String? newPas,
    String? repeatPas,
    bool? isLoading,
    bool? hasError,
    bool? hideShow,
  }) {
    return LeftMenuState(
      name: name ?? this.name,
      image: image ?? this.image,
      lastPas: lastPas ?? this.lastPas,
      newPas: newPas ?? this.newPas,
      repeatPas: repeatPas ?? this.repeatPas,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      hideShow: hideShow ?? this.hideShow,
      reLoad: !reLoad,
    );
  }
}
