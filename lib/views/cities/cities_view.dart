library cities_view;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:text_case_4123123/blocks/cities/cities.dart';
import 'package:text_case_4123123/models/response/city_model.dart';
import 'package:text_case_4123123/widgets/item/city_item.dart';

part 'cities_mobile.dart';
part 'cities_desktop.dart';

class CitiesView extends StatefulWidget {
  const CitiesView({Key? key}) : super(key: key);

  @override
  State<CitiesView> createState() => _CitiesViewState();
}

class _CitiesViewState extends State<CitiesView> {
  late CitiesBloc citiesBloc;

  @override
  Widget build(BuildContext context) {
    citiesBloc = BlocProvider.of<CitiesBloc>(context);
    return ScreenTypeLayout.builder(
      mobile: (c) => _CitiesMobile(citiesBloc: citiesBloc),
      desktop: (c) => _CitiesDesktop(citiesBloc: citiesBloc),
    );
  }
}
