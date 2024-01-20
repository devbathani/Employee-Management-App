import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: "/HomeRoute", initial: true),
        AutoRoute(page: AddEmployeeRoute.page, path: "/AddEmployeeRoute"),
        AutoRoute(page: EditEmployeeRoute.page, path: "/EditEmployeeRoute"),
      ];
}
