/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

class $AssetsVectorGen {
  const $AssetsVectorGen();

  /// Directory path: assets/vector/common
  $AssetsVectorCommonGen get common => const $AssetsVectorCommonGen();

  /// Directory path: assets/vector/splash
  $AssetsVectorSplashGen get splash => const $AssetsVectorSplashGen();
}

class $AssetsVectorCommonGen {
  const $AssetsVectorCommonGen();

  /// File path: assets/vector/common/googleicon.svg
  String get googleicon => 'assets/vector/common/googleicon.svg';

  /// File path: assets/vector/common/logo.svg
  String get logo => 'assets/vector/common/logo.svg';

  /// List of all assets
  List<String> get values => [googleicon, logo];
}

class $AssetsVectorSplashGen {
  const $AssetsVectorSplashGen();

  /// File path: assets/vector/splash/splash_bg.svg
  String get splashBg => 'assets/vector/splash/splash_bg.svg';

  /// List of all assets
  List<String> get values => [splashBg];
}

class Assets {
  Assets._();

  static const $AssetsVectorGen vector = $AssetsVectorGen();
}
