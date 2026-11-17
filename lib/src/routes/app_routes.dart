class AppRoutes {
  AppRoutes._();

  /// Route: '/'
  static final String splash = "/";

  /// Route: '/home'
  static final String home = "/home";

  /// Route: '/invest/:fundId'
  static String invest(String fundId) => "/invest/$fundId";
}
