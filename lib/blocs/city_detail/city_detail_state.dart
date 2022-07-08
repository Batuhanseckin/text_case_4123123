import 'package:equatable/equatable.dart';

abstract class CityDetailState extends Equatable {
  const CityDetailState();
}

class CityDetailInitialState extends CityDetailState {
  @override
  List<Object?> get props => [];
}
