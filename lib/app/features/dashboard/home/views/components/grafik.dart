part of home;

class _Grafik extends StatelessWidget {
  const _Grafik({required this.data, Key? key}) : super(key: key);
  List<charts.Series<Petugas, String>> pemutakhiran() {
    return [
      charts.Series<Petugas, String>(
        id: 'Mobile Sale in Last 4 Year',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (kabupaten, _) => kabupaten.nama!,
        measureFn: (kabupaten, _) => kabupaten.pPemutakhiran!,
        data: data,
        fillColorFn: (Kabupaten, __) => (Kabupaten.pPemutakhiran == 100)
            ? charts.MaterialPalette.green.shadeDefault.lighter
            : charts.MaterialPalette.blue.shadeDefault.lighter,
        labelAccessorFn: (kabupaten, _) =>
            kabupaten.pPemutakhiran!.toStringAsFixed(2),
      )
    ];
  }

  List<charts.Series<Petugas, String>> pencacahan() {
    return [
      charts.Series<Petugas, String>(
        id: 'Mobile Sale in Last 4 Year',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (kabupaten, _) => kabupaten.nama!,
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

  List<charts.Series<Petugas, String>> pemeriksaan() {
    return [
      charts.Series<Petugas, String>(
        id: 'Mobile Sale in Last 4 Year',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (kabupaten, _) => kabupaten.nama!,
        measureFn: (kabupaten, _) => kabupaten.pPemeriksaan!,
        data: data,
        fillColorFn: (Kabupaten, __) => (Kabupaten.pPemeriksaan! <= 300)
            ? charts.MaterialPalette.red.shadeDefault.lighter
            : (Kabupaten.pPemeriksaan! <= 60)
                ? charts.MaterialPalette.yellow.shadeDefault.lighter
                : (Kabupaten.pPemeriksaan == 100)
                    ? charts.MaterialPalette.green.shadeDefault.lighter
                    : charts.MaterialPalette.blue.shadeDefault.lighter,
        labelAccessorFn: (kabupaten, _) =>
            kabupaten.pPemeriksaan!.toStringAsFixed(2),
      )
    ];
  }

  final List<Petugas> data;
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
                barRendererDecorator: charts.BarLabelDecorator<String>(),
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
                      'Progres Pemutakhiran ${data.first.kabkota} (%)')
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
                  charts.ChartTitle(
                      'Progres Pencacahan ${data.first.kabkota} (%)')
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
                    'Progres Pemeriksaan ${data.first.kabkota} (%)',
                  )
                ],
                // primaryMeasureAxis: new charts.PercentAxisSpec(),
              ),
            ],
            options: CarouselOptions(
              // height: CardCloud.height + 200,
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
}

class BarChart {
  final String year;
  final int sale;

  BarChart(this.year, this.sale);
}

_color(double data) {
  try {
    (data <= 40)
        ? charts.MaterialPalette.red.shadeDefault
        : charts.MaterialPalette.green.shadeDefault;
  } catch (e) {
    print("belum ada data");
  }
}
