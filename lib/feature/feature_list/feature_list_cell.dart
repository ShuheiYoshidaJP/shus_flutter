import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shus_flutter/common/enum/platform_type.dart';
import 'package:shus_flutter/common/enum/tech.dart';
import 'package:shus_flutter/common/model/feature.dart';
import 'package:shus_flutter/common/pad.dart';
import 'package:shus_flutter/common/ui_components/small_tip.dart';
import 'package:shus_flutter/common/ui_components/space.dart';
import 'package:shus_flutter/common/styles.dart';

class FeatureListCell extends StatelessWidget {
  final Feature feature;

  const FeatureListCell({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(feature.route),
      child: LayoutBuilder(
        builder: ((context, constraints) {
          if (constraints.maxWidth >= 720) {
            return Container();
          } else {
            return _smallDeviceView(constraints);
          }
        }),
      ),
    );
  }

  // Widget _largeDeviceView() {}

  Widget _smallDeviceView(BoxConstraints constraints) {
    return Column(
      children: [
        _imageView(constraints.maxWidth),
        _detailView(constraints.maxWidth),
      ],
    );
  }

  Widget _imageView(double size) {
    return Image.asset(
      feature.imagePath,
      width: size,
      height: size,
    );
  }

  Widget _detailView(double width) {
    return Padding(
      padding: Pad.h12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            feature.title,
            style: Styles.header,
          ),
          Space.h4,
          if (feature.desctiption != null) ...{
            Text(
              feature.desctiption!,
              style: Styles.body,
            ),
            Space.h4,
          },
          if (feature.uploadAt != null) ...{
            Text(
              feature.uploadAt!.toString(),
              style: Styles.body,
            ),
            Space.h4,
          },
          _platformTypeListView(),
          Space.h4,
          _techsListView(),
          Space.h4,
        ],
      ),
    );
  }

  Widget _platformTypeListView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < feature.platformTypes.length; i++) ...{
            _platformTypeListCell(feature.platformTypes[i]),
            if (i != feature.techs.length - 1) Space.w4,
          }
        ],
      ),
    );
  }

  Widget _platformTypeListCell(PlatformType type) {
    return SmallTip(child: _platformTypeIcon(type));
  }

  Widget _platformTypeIcon(PlatformType type) {
    if (type.hasSingleIcon) {
      return Icon(type.icon[0]);
    } else {
      return Row(
        children: [
          Icon(type.icon[0]),
          Icon(type.icon[1]),
        ],
      );
    }
  }

  Widget _techsListView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < feature.techs.length; i++) ...{
            _techListCell(feature.techs[i]),
            if (i != feature.techs.length - 1) Space.w4,
          }
        ],
      ),
    );
  }

  Widget _techListCell(Tech tech) {
    return SmallTip(
      child: Text(
        tech.title,
        style: Styles.body,
      ),
    );
  }
}
