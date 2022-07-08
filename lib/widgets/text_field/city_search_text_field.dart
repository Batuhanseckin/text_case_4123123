import 'package:flutter/material.dart';

class CitySearchTextField extends StatelessWidget {
  const CitySearchTextField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
