part of home;

class _GrafikPetugas extends StatelessWidget {
  const _GrafikPetugas({required this.data, Key? key}) : super(key: key);

  final List<Kabupaten> data;
  @override
  Widget build(BuildContext context) {
    print(data.length.toString());
    return (data.isEmpty)
        ? const Center(child: CircularProgressIndicator())
        : CarouselSlider(
            items: [
              charts.BarChart(
                pemutakhiran(),
                barGroupingType: charts.BarGroupingType.stacked,
                barRendererDecorator: new charts.BarLabelDecorator<String>(),
                animate: false,
                primaryMeasureAxis: const charts.NumericAxisSpec(
                  tickProviderSpec:
                      charts.BasicNumericTickProviderSpec(zeroBound: false),
                  viewport: charts.NumericExtents(0.0, 100.0),
                ),
                domainAxis: new charts.OrdinalAxisSpec(
                    renderSpec: new charts.SmallTickRendererSpec(

                        // Tick and Label styling here.
                        labelStyle: new charts.TextStyleSpec(
                            fontSize: 14, // size in Pts.
                            color: charts.MaterialPalette.black),

                        // Change the line colors to match text color.
                        lineStyle: new charts.LineStyleSpec(
                            color: charts.MaterialPalette.black))),
                // animationDuration: Duration(seconds: 2),
                vertical: false,
                behaviors: [
                  charts.ChartTitle('Progres Pemutakhiran Provinsi Sulsel (%)')
                ],
                // primaryMeasureAxis: new charts.PercentAxisSpec(),
              ),
              charts.BarChart(
                pencacahan(),
                barGroupingType: charts.BarGroupingType.stacked,
                barRendererDecorator: new charts.BarLabelDecorator<String>(),
                animate: false,
                primaryMeasureAxis: const charts.NumericAxisSpec(
                  tickProviderSpec:
                      charts.BasicNumericTickProviderSpec(zeroBound: false),
                  viewport: charts.NumericExtents(0.0, 100.0),
                ),
                // animationDuration: Duration(seconds: 2),
                vertical: false,
                behaviors: [
                  charts.ChartTitle('Progres Pencacahan Provinsi Sulsel (%)')
                ],
                // primaryMeasureAxis: new charts.PercentAxisSpec(),
              ),
              charts.BarChart(
                pemeriksaan(),
                barGroupingType: charts.BarGroupingType.stacked,
                barRendererDecorator: new charts.BarLabelDecorator<String>(),
                animate: false,
                primaryMeasureAxis: const charts.NumericAxisSpec(
                  tickProviderSpec:
                      charts.BasicNumericTickProviderSpec(zeroBound: false),
                  viewport: charts.NumericExtents(0.0, 100.0),
                ),
                // animationDuration: Duration(seconds: 2),
                vertical: false,
                behaviors: [
                  charts.ChartTitle(
                    'Progres Pemeriksaan Provinsi Sulsel (%)',
                  )
                ],
                // primaryMeasureAxis: new charts.PercentAxisSpec(),
              ),
            ],
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height - 100,
              enlargeCenterPage: true,
              // autoPlay: true,
              // autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              // autoPlayAnimationDuration: Duration(seconds: 2),
              // autoPlayInterval: Duration(seconds: 5),
              viewportFraction: 1,
              // scrollDirection: Axis.vertical,
            ),
          );
  }

  List<charts.Series<Kabupaten, String>> pemutakhiran() {
    return [
      charts.Series<Kabupaten, String>(
        id: 'Mobile Sale in Last 4 Year',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (kabupaten, _) => kabupaten.kabkota!.substring(0,
            (kabupaten.kabkota!.length < 12) ? kabupaten.kabkota!.length : 12),
        measureFn: (kabupaten, _) => kabupaten.pPemutakhiran!,
        data: data,
        fillColorFn: (Kabupaten, __) => (Kabupaten.pPemutakhiran! <= 25)
            ? charts.MaterialPalette.red.shadeDefault.lighter
            : (Kabupaten.pPemutakhiran! <= 50)
                ? charts.MaterialPalette.deepOrange.shadeDefault.lighter
                : (Kabupaten.pPemutakhiran == 100)
                    ? charts.MaterialPalette.green.shadeDefault.lighter
                    : charts.MaterialPalette.blue.shadeDefault.lighter,
        labelAccessorFn: (kabupaten, _) =>
            kabupaten.pPemutakhiran!.toStringAsFixed(2),
      )
    ];
  }

  List<charts.Series<Kabupaten, String>> pencacahan() {
    return [
      charts.Series<Kabupaten, String>(
        id: 'Mobile Sale in Last 4 Year',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (kabupaten, _) => kabupaten.kabkota!.substring(0,
            (kabupaten.kabkota!.length < 12) ? kabupaten.kabkota!.length : 12),
        measureFn: (kabupaten, _) => kabupaten.pPencacahan!,
        data: data,
        fillColorFn: (Kabupaten, __) => (Kabupaten.pPencacahan! <= 25)
            ? charts.MaterialPalette.red.shadeDefault.lighter
            : (Kabupaten.pPencacahan! <= 50)
                ? charts.MaterialPalette.deepOrange.shadeDefault.lighter
                : (Kabupaten.pPencacahan == 100)
                    ? charts.MaterialPalette.green.shadeDefault.lighter
                    : charts.MaterialPalette.blue.shadeDefault.lighter,
        labelAccessorFn: (kabupaten, _) =>
            kabupaten.pPencacahan!.toStringAsFixed(2),
      )
    ];
  }

  List<charts.Series<Kabupaten, String>> pemeriksaan() {
    return [
      charts.Series<Kabupaten, String>(
        id: 'Mobile Sale in Last 4 Year',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (kabupaten, _) => kabupaten.kabkota!.substring(0,
            (kabupaten.kabkota!.length < 12) ? kabupaten.kabkota!.length : 12),
        measureFn: (kabupaten, _) => kabupaten.pPemeriksaan!,
        data: data,
        fillColorFn: (Kabupaten, __) => (Kabupaten.pPemeriksaan! <= 25)
            ? charts.MaterialPalette.red.shadeDefault.lighter
            : (Kabupaten.pPemeriksaan! <= 50)
                ? charts.MaterialPalette.deepOrange.shadeDefault.lighter
                : (Kabupaten.pPemeriksaan == 100)
                    ? charts.MaterialPalette.green.shadeDefault.lighter
                    : charts.MaterialPalette.blue.shadeDefault.lighter,
        labelAccessorFn: (kabupaten, _) =>
            kabupaten.pPemeriksaan!.toStringAsFixed(2),
      )
    ];
  }
}

class BarCharts {
  final String year;
  final int sale;

  BarCharts(this.year, this.sale);
}

_colors(double data) {
  try {
    (data <= 40)
        ? charts.MaterialPalette.red.shadeDefault
        : charts.MaterialPalette.green.shadeDefault;
  } catch (e) {
    print("belum ada data");
  }
}
