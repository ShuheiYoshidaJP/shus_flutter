// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shus_flutter/common/enum/platform_type.dart';
import 'package:shus_flutter/common/enum/tech.dart';
import 'package:shus_flutter/common/router/route_path.dart';

part 'feature.freezed.dart';

@freezed
class Feature with _$Feature {
  factory Feature({
    @Default('') String title,
    @Default('') String desctiption,
    @Default(RoutePath.init) RoutePath path,
    DateTime? uploadAt,
    @Default([]) List<PlatformType> platformTypes,
    @Default([]) List<Tech> techs,
  }) = _Feature;
}
