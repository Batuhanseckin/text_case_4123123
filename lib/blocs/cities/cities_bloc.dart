import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:text_case_4123123/blocs/cities/cities_event.dart';
import 'package:text_case_4123123/blocs/cities/cities_state.dart';
import 'package:text_case_4123123/core/router/app_router.gr.dart';
import 'package:text_case_4123123/models/response/base_model.dart';
import 'package:text_case_4123123/models/response/city_model.dart';
import 'package:text_case_4123123/repository/cities_repository.dart';

import '../../locator.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesRepository loginRepository = locator<CitiesRepository>();
  late List<CityModel> cities;
  late List<CityModel> backUpCities;
  late int selectedCityIndex;

  CitiesBloc() : super(GetAllCitiesInitialState());

  @override
  Stream<CitiesState> mapEventToState(CitiesEvent event) async* {
    if (event is GetAllCitiesEvent) {
      yield GetAllCitiesLoadingState();
      final BaseModel? baseModel = await loginRepository.getAllCities();
      if (baseModel == null || baseModel.error == null || baseModel.error!) {
        yield GetAllCitiesErrorState();
      } else {
        cities =
            (baseModel.data as List).map((e) => CityModel.fromJson(e)).toList();
        backUpCities = List.from(cities);
        yield GetAllCitiesLoadedState(cities);
      }
    } else if (event is FilterCitiesEvent) {
      filterCities(event.filterString);
      yield FilterDataFinishedState(cities);
    }
  }

  void filterCities(String filterString) {
    cities = backUpCities
        .where(
          (x) => x.city == null
              ? false
              : x.city!.toLowerCase().contains(filterString.toLowerCase()),
        )
        .toList();
  }

  onTapCityItem(BuildContext context, int index) {
    selectedCityIndex = index;
    context.router.push(const CityDetailView());
  }
}

/// Sample linear data type.
class PopulationModel {
  final String year;
  final int population;

  PopulationModel(this.year, this.population);
}
