import 'package:shus_flutter/common/enum/platform_type.dart';
import 'package:shus_flutter/common/enum/tech.dart';
import 'package:shus_flutter/common/model/feature.dart';
import 'package:shus_flutter/common/router/app_router.dart';

final allFeature = [
  Feature(
    title: 'MLKit Pose Detection',
    imagePath: 'assets/images/pose.jpeg',
    desctiption: 'ネイティブのコードを呼び出すMethodChannelを使って、体の骨格検知を行う。',
    route: const PoseInitialRoute(),
    platformTypes: [
      PlatformType.android,
      PlatformType.ios,
    ],
    techs: [
      Tech.mLKit,
      Tech.methodChannel,
      Tech.kotlin,
      Tech.swift,
    ],
  ),
];
