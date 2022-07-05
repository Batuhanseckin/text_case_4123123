part of cities_view;

class _CitiesDesktop extends StatelessWidget {
  const _CitiesDesktop({Key? key, required this.citiesBloc}) : super(key: key);

  final CitiesBloc citiesBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  Widget get _buildBody => const Center(
        child: Text("_CitiesDesktop"),
      );
}
