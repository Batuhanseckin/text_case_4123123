import 'package:equatable/equatable.dart';
import 'package:text_case_4123123/models/response/city_model.dart';

abstract class CitiesState extends Equatable {
  const CitiesState();
}

class GetAllCitiesInitialState extends CitiesState {
  @override
  List<Object> get props => [];
}

class GetAllCitiesLoadingState extends CitiesState {
  @override
  List<Object> get props => [];
}

class GetAllCitiesErrorState extends CitiesState {
  @override
  List<Object> get props => [];
}

class GetAllCitiesLoadedState extends CitiesState {
  final List<CityModel> cities;

  const GetAllCitiesLoadedState(this.cities);

  @override
  List<Object> get props => [cities];
}
