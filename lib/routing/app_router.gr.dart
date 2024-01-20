// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:realtime_innovation_assignment/modules/home/model/employee_entity.dart'
    as _i6;
import 'package:realtime_innovation_assignment/modules/home/view/add_employee_screen.dart'
    as _i1;
import 'package:realtime_innovation_assignment/modules/home/view/edit_employee_screen.dart'
    as _i2;
import 'package:realtime_innovation_assignment/modules/home/view/home_screen.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AddEmployeeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddEmployeeScreen(),
      );
    },
    EditEmployeeRoute.name: (routeData) {
      final args = routeData.argsAs<EditEmployeeRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.EditEmployeeScreen(
          key: args.key,
          employeeEntity: args.employeeEntity,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddEmployeeScreen]
class AddEmployeeRoute extends _i4.PageRouteInfo<void> {
  const AddEmployeeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AddEmployeeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddEmployeeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditEmployeeScreen]
class EditEmployeeRoute extends _i4.PageRouteInfo<EditEmployeeRouteArgs> {
  EditEmployeeRoute({
    _i5.Key? key,
    required _i6.EmployeeEntity employeeEntity,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          EditEmployeeRoute.name,
          args: EditEmployeeRouteArgs(
            key: key,
            employeeEntity: employeeEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'EditEmployeeRoute';

  static const _i4.PageInfo<EditEmployeeRouteArgs> page =
      _i4.PageInfo<EditEmployeeRouteArgs>(name);
}

class EditEmployeeRouteArgs {
  const EditEmployeeRouteArgs({
    this.key,
    required this.employeeEntity,
  });

  final _i5.Key? key;

  final _i6.EmployeeEntity employeeEntity;

  @override
  String toString() {
    return 'EditEmployeeRouteArgs{key: $key, employeeEntity: $employeeEntity}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
