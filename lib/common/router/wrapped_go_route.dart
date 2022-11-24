import 'package:go_router/go_router.dart';
import 'package:shus_flutter/common/router/route_path.dart';

class WrappedGoRoute extends GoRoute {
  final RoutePath routePath;
  WrappedGoRoute({
    required this.routePath,
    super.name,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.redirect,
    super.routes = const <RouteBase>[],
  }) : super(path: routePath.value);
}
