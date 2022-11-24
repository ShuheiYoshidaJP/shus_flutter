import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shus_flutter/common/router/route_path.dart';
import 'package:shus_flutter/common/router/wrapped_go_route.dart';
import 'package:shus_flutter/feature/feature_list/feature_list_page.dart';
import 'package:shus_flutter/feature/pose/pose_page.dart';

final appRouter = GoRouter(
  routes: <RouteBase>[
    WrappedGoRoute(
      routePath: RoutePath.init,
      builder: (BuildContext context, GoRouterState state) {
        return const FeatureListPage();
      },
      routes: <RouteBase>[
        WrappedGoRoute(
          routePath: RoutePath.pose,
          builder: (BuildContext context, GoRouterState state) {
            return const PosePage();
          },
        ),
      ],
    ),
  ],
);
