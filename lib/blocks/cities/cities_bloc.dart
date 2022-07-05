import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:text_case_4123123/blocks/cities/cities_event.dart';
import 'package:text_case_4123123/blocks/cities/cities_state.dart';
import 'package:text_case_4123123/models/response/base_model.dart';
import 'package:text_case_4123123/models/response/city_model.dart';
import 'package:text_case_4123123/repository/cities_repository.dart';

import '../../locator.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesRepository loginRepository = locator<CitiesRepository>();

  CitiesBloc() : super(GetAllCitiesInitialState());

  @override
  Stream<CitiesState> mapEventToState(CitiesEvent event) async* {
    if (event is GetAllCitiesEvent) {
      yield GetAllCitiesLoadingState();
      final BaseModel baseModel = await loginRepository.getAllCities();
      if (baseModel.error != null && baseModel.error!) {
        yield GetAllCitiesErrorState();
      } else {
        List<CityModel> cities =
            (baseModel.data as List).map((e) => CityModel.fromJson(e)).toList();
        yield GetAllCitiesLoadedState(cities);
      }
    }
  }
}
