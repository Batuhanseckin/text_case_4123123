import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_case_4123123/blocs/city_detail/city_detail.dart';

import 'blocs/cities/cities_bloc.dart';
import 'core/router/app_router.gr.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _getProviders,
      child: ScreenUtilInit(
        designSize: const Size(375, 667),
        builder: (context, child) => _buildMaterialAppRouter,
      ),
    );
  }

  List<BlocProvider> get _getProviders => [
        BlocProvider<CitiesBloc>(
          create: (BuildContext context) => CitiesBloc(),
        ),
        BlocProvider<CityDetailBloc>(
          create: (BuildContext context) => CityDetailBloc(),
        ),
      ];

  Widget get _buildMaterialAppRouter => MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: kDebugMode,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      );
}
