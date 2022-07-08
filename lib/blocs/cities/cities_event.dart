import 'package:equatable/equatable.dart';

abstract class CitiesEvent extends Equatable {
  const CitiesEvent();
}

class GetAllCitiesEvent extends CitiesEvent {
  @override
  List<Object> get props => [];
}

class FilterCitiesEvent extends CitiesEvent {
  final String filterString;

  const FilterCitiesEvent(this.filterString);
  @override
  List<Object> get props => [filterString];
}
