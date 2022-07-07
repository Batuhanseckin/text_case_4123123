library city_detail_view;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:text_case_4123123/blocks/cities/cities.dart';

part 'city_detail_desktop.dart';
part 'city_detail_mobile.dart';

class CityDetailView extends StatefulWidget {
  const CityDetailView({Key? key}) : super(key: key);

  @override
  State<CityDetailView> createState() => _CitiesViewState();
}

class _CitiesViewState extends State<CityDetailView> {
  late CitiesBloc citiesBloc;

  @override
  Widget build(BuildContext context) {
    citiesBloc = BlocProvider.of<CitiesBloc>(context);
    return ScreenTypeLayout.builder(
      mobile: (c) => const _CityDetailMobile(),
      desktop: (c) => const _CityDetialDesktop(),
    );
  }
}
