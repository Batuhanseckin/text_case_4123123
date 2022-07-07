import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_case_4123123/blocks/city_detail/city_detail.dart';

class CityDetailBloc extends Bloc<CityDetailEvent, CityDetailState> {
  CityDetailBloc() : super(CityDetailInitialState());

  @override
  Stream<CityDetailState> mapEventToState(CityDetailEvent event) async* {}
}
