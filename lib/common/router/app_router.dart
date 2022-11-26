import 'package:auto_route/auto_route.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:shus_flutter/feature/feature_list/feature_list_page.dart';
import 'package:shus_flutter/feature/pose/pose_initial_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: FeatureListPage,
      initial: true,
    ),
    AutoRoute(
      page: PoseInitialPage,
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
