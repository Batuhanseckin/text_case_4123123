import 'package:flutter/material.dart';
import 'package:text_case_4123123/models/response/city_model.dart';

class CityItem extends StatelessWidget {
  const CityItem({Key? key, required this.cityModel}) : super(key: key);
  final CityModel cityModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(cityModel.city ?? ""),
        subtitle: Text(cityModel.country ?? ""),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
