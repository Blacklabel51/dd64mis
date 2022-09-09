part of home;

class _Grafik extends StatelessWidget {
  const _Grafik({required this.data, Key? key}) : super(key: key);
  List<charts.Series<Petugas, String>> pemutakhiran() {
    return [
      charts.Series<Petugas, String>(
        id: 'Mobile Sale in Last 4 Year',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (kabupaten, _) => kabupaten.nama!,
        measureFn: (kabupaten, _) => kabupaten.pemutakhiran!,
        data: data,
        fillColorFn: (Kabupaten, __) => (Kabupaten.pemutakhiran == 100)
            ? charts.MaterialPalette.green.shadeDefault.lighter
            : charts.MaterialPalette.blue.shadeDefault.lighter,
        labelAccessorFn: (kabupaten, _) =>
            kabupaten.pemutakhiran!.toStringAsFixed(2),
      )
    ];
  }

  List<charts.Series<Petugas, String>> pencacahan() {
    return [
      charts.Series<Petugas, String>(
        id: 'Mobile Sale in Last 4 Year',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (kabupaten, _) => kabupaten.nama!,
        measureFn: (kabupaten, _) => kabupaten.pencacahan!,
        data: data,
        fillColorFn: (Kabupaten, __) => (Kabupaten.pencacahan! <= 25)
            ? charts.MaterialPalette.red.shadeDefault.lighter
            : (Kabupaten.pencacahan! <= 50)
                ? charts.MaterialPalette.deepOrange.shadeDefault.lighter
                : (Kabupaten.pencacahan == 100)
                    ? charts.MaterialPalette.green.shadeDefault.lighter
                    : charts.MaterialPalette.blue.shadeDefault.lighter,
        labelAccessorFn: (kabupaten, _) =>
            kabupaten.pencacahan!.toStringAsFixed(2),
      )
    ];
  }

  List<charts.Series<Petugas, String>> pemeriksaan() {
    return [
      charts.Series<Petugas, String>(
        id: 'Mobile Sale in Last 4 Year',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (kabupaten, _) => kabupaten.nama!,
        measureFn: (kabupaten, _) => kabupaten.pemeriksaan!,
        data: data,
        fillColorFn: (Kabupaten, __) => (Kabupaten.pemeriksaan! <= 300)
            ? charts.MaterialPalette.red.shadeDefault.lighter
            : (Kabupaten.pemeriksaan! <= 60)
                ? charts.MaterialPalette.yellow.shadeDefault.lighter
                : (Kabupaten.pemeriksaan == 100)
                    ? charts.MaterialPalette.green.shadeDefault.lighter
                    : charts.MaterialPalette.blue.shadeDefault.lighter,
        labelAccessorFn: (kabupaten, _) =>
            kabupaten.pemeriksaan!.toStringAsFixed(2),
      )
    ];
  }

  // List<charts.Series<Petugas, String>> pengolahan() {
  //   return [
  //     charts.Series<Petugas, String>(
  //       id: 'Mobile Sale in Last 4 Year',
  //       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
  //       domainFn: (kabupaten, _) => kabupaten.kabkota!,
  //       measureFn: (kabupaten, _) => kabupaten.pOlah!,
  //       data: data,
  //       fillColorFn: (_, __) =>
  //           charts.MaterialPalette.blue.shadeDefault.lighter,
  //     )
  //   ];
  // }
  // new charts.Series<Kabupaten, String>(
  //   id: 'Mobile Sale in Last 3 Year',
  //   colorFn: (kabupaten, _) => (kabupaten.pPemeriksaan! <= 40)
  //       ? charts.MaterialPalette.red.shadeDefault
  //       : charts.MaterialPalette.green.shadeDefault,
  //   domainFn: (kabupaten, _) => kabupaten.kabkota!,
  //   measureFn: (kabupaten, _) => kabupaten.pPemeriksaan!,
  //   data: data,
  // ),
  // new charts.Series<Kabupaten, String>(
  //   id: 'Mobile Sale in Last 2 Year',
  //   colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
  //   // fillColorFn: (_, __) => charts.MaterialPalette.transparent,
  //   domainFn: (kabupaten, _) => kabupaten.kabkota!,
  //   measureFn: (kabupaten, _) => kabupaten.pDokClean!,
  //   data: data,
  // )

  final List<Petugas> data;
  @override
  Widget build(BuildContext context) {
    print(data.length.toString());
    return (data.isEmpty)
        ? const Center(child: CircularProgressIndicator())
        : CarouselSlider(
            items: [
              SizedBox(
                height: 500,
                child: charts.BarChart(
                  pemutakhiran(),
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
                  behaviors: [charts.ChartTitle('Progres Pemutakhiran (%)')],
                  // primaryMeasureAxis: new charts.PercentAxisSpec(),
                ),
              ),
              SizedBox(
                height: 500,
                child: charts.BarChart(
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
                  behaviors: [charts.ChartTitle('Progres Pencacahan (%)')],
                  // primaryMeasureAxis: new charts.PercentAxisSpec(),
                ),
              ),
              SizedBox(
                height: 500,
                child: charts.BarChart(
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
                    charts.ChartTitle('Progres Pemeriksaan (%)',
                        titleOutsideJustification:
                            charts.OutsideJustification.middleDrawArea)
                  ],
                  // primaryMeasureAxis: new charts.PercentAxisSpec(),
                ),
              ),
              // SizedBox(
              //   height: 500,
              //   child: charts.BarChart(
              //     pengolahan(),
              //     barGroupingType: charts.BarGroupingType.stacked,
              //     animate: false,
              //     primaryMeasureAxis: const charts.NumericAxisSpec(
              //       tickProviderSpec:
              //           charts.BasicNumericTickProviderSpec(zeroBound: false),
              //       viewport: charts.NumericExtents(0.0, 100.0),
              //     ),
              //     // animationDuration: Duration(seconds: 2),
              //     vertical: false,
              //     behaviors: [
              //       charts.ChartTitle('Progres Pengolahan (%)',
              //           titleOutsideJustification:
              //               charts.OutsideJustification.middleDrawArea)
              //     ],
              //     // primaryMeasureAxis: new charts.PercentAxisSpec(),
              //   ),
              // ),
            ],
            options: CarouselOptions(
              height: CardCloud.height + 200,
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
