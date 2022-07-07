import 'package:auto_route/auto_route.dart';
import 'package:text_case_4123123/views/cities/cities_view.dart';

import '../../views/city_detail/city_detail_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: CitiesView, initial: true),
    AutoRoute(page: CityDetailView, initial: true),
  ],
)
class $AppRouter {}
