import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shus_flutter/common/model/feature.dart';
import 'package:shus_flutter/feature/feature_list/all_feature.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('feature list'),
            const SizedBox(
              height: 16,
            ),
            Text(
              'current route path: ${ModalRoute.of(context)?.settings.name}',
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton(
              child: const Text('next'),
              onPressed: () => context.pushRoute(featureList[0].route),
            ),
          ],
        ),
      ),
    );
  }
}
