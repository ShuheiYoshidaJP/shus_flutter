enum RoutePath {
  init,
  pose;

  String get value {
    switch (this) {
      case RoutePath.init:
        return '/';
      case RoutePath.pose:
        return 'pose';
    }
  }

  // add slash
  String get location {
    switch (this) {
      case RoutePath.init:
        return value;
      default:
        return '/$value';
    }
  }
}
