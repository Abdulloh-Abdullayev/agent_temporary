/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsColorGen {
  const $AssetsColorGen();

  /// File path: assets/color/colors.xml
  String get colors => 'assets/color/colors.xml';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();
}

class $AssetsLangsGen {
  const $AssetsLangsGen();

  /// File path: assets/langs/en-EN.json
  String get enEN => 'assets/langs/en-EN.json';

  /// File path: assets/langs/ru-RU.json
  String get ruRU => 'assets/langs/ru-RU.json';

  /// File path: assets/langs/uz-UZ.json
  String get uzUZ => 'assets/langs/uz-UZ.json';
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/Image_icon.svg
  SvgGenImage get imageIcon =>
      const SvgGenImage('assets/images/icons/Image_icon.svg');

  /// File path: assets/images/icons/back_icon.svg
  SvgGenImage get backIcon =>
      const SvgGenImage('assets/images/icons/back_icon.svg');

  /// File path: assets/images/icons/communication.svg
  SvgGenImage get communication =>
      const SvgGenImage('assets/images/icons/communication.svg');

  /// File path: assets/images/icons/communication_active.svg
  SvgGenImage get communicationActive =>
      const SvgGenImage('assets/images/icons/communication_active.svg');

  /// File path: assets/images/icons/draft.svg
  SvgGenImage get draft => const SvgGenImage('assets/images/icons/draft.svg');

  /// File path: assets/images/icons/draft_active.svg
  SvgGenImage get draftActive =>
      const SvgGenImage('assets/images/icons/draft_active.svg');

  /// File path: assets/images/icons/filtr_icon.svg
  SvgGenImage get filtrIcon =>
      const SvgGenImage('assets/images/icons/filtr_icon.svg');

  /// File path: assets/images/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/images/icons/home.svg');

  /// File path: assets/images/icons/home_active.svg
  SvgGenImage get homeActive =>
      const SvgGenImage('assets/images/icons/home_active.svg');

  /// File path: assets/images/icons/interesting.svg
  SvgGenImage get interesting =>
      const SvgGenImage('assets/images/icons/interesting.svg');

  /// File path: assets/images/icons/interesting_active.svg
  SvgGenImage get interestingActive =>
      const SvgGenImage('assets/images/icons/interesting_active.svg');

  /// File path: assets/images/icons/location.svg
  SvgGenImage get location =>
      const SvgGenImage('assets/images/icons/location.svg');

  /// File path: assets/images/icons/location_active.svg
  SvgGenImage get locationActive =>
      const SvgGenImage('assets/images/icons/location_active.svg');

  /// File path: assets/images/icons/location_buuton.svg
  SvgGenImage get locationBuuton =>
      const SvgGenImage('assets/images/icons/location_buuton.svg');

  /// File path: assets/images/icons/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/images/icons/menu.svg');

  /// File path: assets/images/icons/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/images/icons/notification.svg');

  /// File path: assets/images/icons/pie_chart.svg
  SvgGenImage get pieChart =>
      const SvgGenImage('assets/images/icons/pie_chart.svg');

  /// File path: assets/images/icons/pie_chart_active.svg
  SvgGenImage get pieChartActive =>
      const SvgGenImage('assets/images/icons/pie_chart_active.svg');

  /// File path: assets/images/icons/pin_button.svg
  SvgGenImage get pinButton =>
      const SvgGenImage('assets/images/icons/pin_button.svg');

  /// File path: assets/images/icons/place.svg
  SvgGenImage get place => const SvgGenImage('assets/images/icons/place.svg');

  /// File path: assets/images/icons/place_active.svg
  SvgGenImage get placeActive =>
      const SvgGenImage('assets/images/icons/place_active.svg');

  /// File path: assets/images/icons/profile.svg
  SvgGenImage get profile =>
      const SvgGenImage('assets/images/icons/profile.svg');

  /// File path: assets/images/icons/profile_active.svg
  SvgGenImage get profileActive =>
      const SvgGenImage('assets/images/icons/profile_active.svg');

  /// File path: assets/images/icons/saved_ones.svg
  SvgGenImage get savedOnes =>
      const SvgGenImage('assets/images/icons/saved_ones.svg');

  /// File path: assets/images/icons/saved_ones_active.svg
  SvgGenImage get savedOnesActive =>
      const SvgGenImage('assets/images/icons/saved_ones_active.svg');

  /// File path: assets/images/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/images/icons/search.svg');

  /// File path: assets/images/icons/search_active.svg
  SvgGenImage get searchActive =>
      const SvgGenImage('assets/images/icons/search_active.svg');

  /// File path: assets/images/icons/search_button.svg
  SvgGenImage get searchButton =>
      const SvgGenImage('assets/images/icons/search_button.svg');

  /// File path: assets/images/icons/shopping.svg
  SvgGenImage get shopping =>
      const SvgGenImage('assets/images/icons/shopping.svg');
}

class Assets {
  Assets._();

  static const $AssetsColorGen color = $AssetsColorGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLangsGen langs = $AssetsLangsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
