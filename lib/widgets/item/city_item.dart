import 'package:flutter/material.dart';
import 'package:text_case_4123123/core/constants/app_constants.dart';
import 'package:text_case_4123123/models/response/city_model.dart';

class CityItem extends StatelessWidget {
  const CityItem({Key? key, required this.cityModel, required this.onTap})
      : super(key: key);
  final CityModel cityModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Hero(
          tag: AppConstants.cityImageHeroTag,
          child: Image.network(cityModel.image!),
        ),
        onTap: onTap,
        title: Text(cityModel.city ?? ""),
        subtitle: Text(cityModel.country ?? ""),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
