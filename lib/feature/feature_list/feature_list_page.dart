import 'package:flutter/material.dart';
import 'package:shus_flutter/common/model/feature.dart';
import 'package:shus_flutter/feature/feature_list/all_feature.dart';
import 'package:shus_flutter/feature/feature_list/feature_list_cell.dart';

class FeatureListPage extends StatefulWidget {
  const FeatureListPage({Key? key}) : super(key: key);

  @override
  State<FeatureListPage> createState() => _FeatureListPageState();
}

class _FeatureListPageState extends State<FeatureListPage> {
  List<Feature> featureList = allFeature;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: featureList.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var feature = featureList[index];
            return FeatureListCell(feature: feature);
          },
        ),
    );
  }
}
