import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:text_case_4123123/blocks/cities/cities_event.dart';
import 'package:text_case_4123123/blocks/cities/cities_state.dart';
import 'package:text_case_4123123/core/router/app_router.gr.dart';
import 'package:text_case_4123123/models/response/base_model.dart';
import 'package:text_case_4123123/models/response/city_model.dart';
import 'package:text_case_4123123/repository/cities_repository.dart';

import '../../locator.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesRepository loginRepository = locator<CitiesRepository>();
  late List<CityModel> cities;
  late List<CityModel> backUpCities;

  CitiesBloc() : super(GetAllCitiesInitialState());

  @override
  Stream<CitiesState> mapEventToState(CitiesEvent event) async* {
    if (event is GetAllCitiesEvent) {
      yield GetAllCitiesLoadingState();
      final BaseModel baseModel = await loginRepository.getAllCities();
      if (baseModel.error != null && baseModel.error!) {
        yield GetAllCitiesErrorState();
      } else {
        cities =
            (baseModel.data as List).map((e) => CityModel.fromJson(e)).toList();
        backUpCities = List.from(cities);
        yield GetAllCitiesLoadedState(cities);
      }
    } else if (event is FilterCitiesEvent) {
      cities = backUpCities
          .where(
            (x) => x.city == null
                ? false
                : x.city!
                    .toLowerCase()
                    .contains(event.filterData.toLowerCase()),
          )
          .toList();
      yield FilterDataFinishedState(cities);
    }
  }

  onTapCityItem(BuildContext context) {
    context.router.push(const CityDetailView());
  }
}
