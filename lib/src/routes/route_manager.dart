import 'package:go_router/go_router.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/home/presentation/pages/invest_page.dart';

class RouteManager {
  RouteManager._() {
    _router = GoRouter(
      initialLocation: '/home',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(path: '/home', builder: (context, state) => HomePage()),
        GoRoute(
          path: '/invest/:fundId',
          builder: (context, state) {
            final fundId = state.pathParameters["fundId"];
            return InvestPage(fundId: fundId!);
          },
        ),
      ],
    );
  }

  static RouteManager instance = RouteManager._();

  late final GoRouter _router;

  GoRouter get router => _router;
}
