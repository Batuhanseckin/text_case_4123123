part of cities_view;

class _CitiesMobile extends StatefulWidget {
  const _CitiesMobile({Key? key, required this.citiesBloc}) : super(key: key);

  final CitiesBloc citiesBloc;

  @override
  State<_CitiesMobile> createState() => _CitiesMobileState();
}

class _CitiesMobileState extends State<_CitiesMobile> {
  @override
  void dispose() {
    widget.citiesBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    widget.citiesBloc.add(GetAllCitiesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  Widget get _buildBody => BlocBuilder<CitiesBloc, CitiesState>(
        builder: (context, state) {
          if (state is GetAllCitiesLoadingState) {
            return _buildLoading;
          } else if (state is GetAllCitiesLoadedState) {
            return _buildLoaded(state.cities);
          } else if (state is FilterDataFinishedState) {
            return _buildSearched(state.cities);
          } else if (state is GetAllCitiesErrorState) {
            return _buildError;
          }
          return Container();
        },
      );

  Widget get _buildLoading => const Center(child: CircularProgressIndicator());

  Widget get _buildError => const Center(child: Text("Error Widget here"));

  Widget _buildSearched(List<CityModel> items) => _buildLoaded(items);

  Widget _buildLoaded(List<CityModel> items) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            _buildTitle,
            SizedBox(height: 10.h),
            _buildSearch,
            SizedBox(height: 10.h),
            _buildCities(items),
          ],
        ),
      );

  Widget get _buildSearch => CitySearchTextField(
        onChanged: (value) => widget.citiesBloc.add(FilterCitiesEvent(value)),
      );
  Widget get _buildTitle => Text(
        "Şehirler",
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      );

  Widget _buildCities(List<CityModel> items) => Expanded(
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return CityItem(
              cityModel: items[index],
              onTap: () {
                widget.citiesBloc.onTapCityItem(context, index);
              },
            );
          },
          separatorBuilder: (c, i) => const SizedBox(height: 2),
          itemCount: items.length > 20 ? 20 : items.length,
        ),
      );
}
