import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_case_4123123/blocks/cities/cities.dart';
import 'package:text_case_4123123/models/response/city_model.dart';

class CityItem extends StatelessWidget {
  const CityItem({Key? key, required this.cityModel}) : super(key: key);
  final CityModel cityModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          BlocProvider.of<CitiesBloc>(context).onTapCityItem(context);
        },
        title: Text(cityModel.city ?? ""),
        subtitle: Text(cityModel.country ?? ""),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
