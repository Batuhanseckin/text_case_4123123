part of city_detail_view;

class _CityDetailMobile extends StatefulWidget {
  const _CityDetailMobile({Key? key}) : super(key: key);

  @override
  State<_CityDetailMobile> createState() => _CityDetailMobileState();
}

class _CityDetailMobileState extends State<_CityDetailMobile> {
  late CitiesBloc citiesBloc;

  get _buildMap => GestureDetector(
        onTap: () {
          var lat = citiesBloc.cities[citiesBloc.selectedCityIndex].lat;
          var long = citiesBloc.cities[citiesBloc.selectedCityIndex].long;
          launchUrlString(
            "http://maps.google.com/maps?saddr=" +
                lat.toString() +
                "," +
                long.toString(),
          );
          // http://maps.google.com/maps?saddr=" + sourceLatitude + "," + sourceLongitude
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          width: double.infinity,
          height: 100.h,
          child: Image.asset(
            "assets/images/google-maps-uygulama-pazarlamasyon.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    citiesBloc = BlocProvider.of<CitiesBloc>(context);
    return Scaffold(
      body: _buildBody,
    );
  }

  get _buildBackButton => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );

  get _buildImage => Container(
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 2.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Hero(
            tag: AppConstants.cityImageHeroTag,
            child: Image(
              image: NetworkImage(
                citiesBloc.cities[citiesBloc.selectedCityIndex].image!,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget get _buildBody => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageAndTitle,
          Expanded(child: _buildScroll),
        ],
      );

  Widget get _buildScroll => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            _buildTitle("populations"),
            _buildChart,
            SizedBox(height: 30.h),
            _buildTitle("click map image to view on google map"),
            SizedBox(height: 5.h),
            _buildMap,
            SizedBox(height: 30.h),
          ],
        ),
      );

  Widget _buildTitle(String title) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget get _buildImageAndTitle => Stack(
        children: <Widget>[
          _buildImage,
          _buildBackButton,
          _buildCityNameAndCountryName,
        ],
      );

  Widget get _buildCityNameAndCountryName => Positioned(
        left: 20.0,
        bottom: 20.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              citiesBloc.cities[citiesBloc.selectedCityIndex].city!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.add_a_photo,
                  size: 15.0,
                  color: Colors.white70,
                ),
                const SizedBox(width: 5.0),
                Text(
                  citiesBloc.cities[citiesBloc.selectedCityIndex].country!,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget get _buildChart => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        height: 200.h,
        child: charts.BarChart(
          getPopulationData,
          animate: true,
          primaryMeasureAxis: const charts.NumericAxisSpec(
            renderSpec: charts.SmallTickRendererSpec(),
          ),
        ),
      );

  /// Create one series with sample hard coded data.
  List<charts.Series<PopulationModel, String>> get getPopulationData {
    List<PopulationModel> data = [];
    citiesBloc.cities[citiesBloc.selectedCityIndex].populationCounts!
        .sort((a, b) => a.year!.compareTo(b.year!));
    if (citiesBloc
            .cities[citiesBloc.selectedCityIndex].populationCounts!.length <
        10) {
      data = citiesBloc.cities[citiesBloc.selectedCityIndex].populationCounts!
          .map((e) {
        return PopulationModel(e.year!.toString(), e.value!.ceil());
      }).toList();
    } else {
      for (int i = 0; i < 10; i++) {
        data.add(
          PopulationModel(
            citiesBloc
                .cities[citiesBloc.selectedCityIndex].populationCounts![i].year!
                .toString(),
            citiesBloc.cities[citiesBloc.selectedCityIndex].populationCounts![i]
                .value!
                .ceil(),
          ),
        );
      }
    }

    return [
      charts.Series<PopulationModel, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (PopulationModel sales, _) => sales.year,
        measureFn: (PopulationModel sales, _) => sales.population,
        data: data,
      )
    ];
  }
}
