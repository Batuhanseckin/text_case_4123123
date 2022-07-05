import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_case_4123123/blocks/cities/cities_bloc.dart';
import 'package:text_case_4123123/views/cities/cities_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CitiesBloc>(
          create: (BuildContext context) => CitiesBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 667),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: kDebugMode,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const CitiesView(),
        ),
      ),
    );
  }
}
