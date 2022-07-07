// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../views/cities/cities_view.dart' as _i1;
import '../../views/city_detail/city_detail_view.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CitiesView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CitiesView());
    },
    CityDetailView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.CityDetailView());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(CitiesView.name, path: '/'),
        _i3.RouteConfig(CityDetailView.name, path: '/')
      ];
}

/// generated route for
/// [_i1.CitiesView]
class CitiesView extends _i3.PageRouteInfo<void> {
  const CitiesView() : super(CitiesView.name, path: '/');

  static const String name = 'CitiesView';
}

/// generated route for
/// [_i2.CityDetailView]
class CityDetailView extends _i3.PageRouteInfo<void> {
  const CityDetailView() : super(CityDetailView.name, path: '/');

  static const String name = 'CityDetailView';
}
