// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shus_flutter/common/enum/platform_type.dart';
import 'package:shus_flutter/common/enum/tech.dart';

part 'feature.freezed.dart';

@freezed
class Feature with _$Feature {
  factory Feature({
    @Default('') String title,
    @Default('') String desctiption,
    required PageRouteInfo route,
    DateTime? uploadAt,
    @Default([]) List<PlatformType> platformTypes,
    @Default([]) List<Tech> techs,
  }) = _Feature;
}
