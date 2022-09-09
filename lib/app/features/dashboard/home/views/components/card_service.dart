part of home;

class _CardService extends StatelessWidget {
  const _CardService({required this.data, Key? key}) : super(key: key);
  final List<Jadwal> data;
  double get kDefaultSpacing => 10;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: data.map((e) {
        var akhir = e.tanggal!.add(const Duration(days: 1));
        var selisih = akhir.difference(DateTime.now());
        var hari = selisih.inDays;
        var jam = selisih.inHours;
        var isLewat = jam.isNegative;
        return Padding(
          padding: const EdgeInsets.all(10),
          child: CardCloud(
            title: e.keterangan!,
            serviceName: (isLewat) ? "Lewat" : "Tinggal",
            imageAsset: ImageRaster.megaphone,
            totalStorage:
                (hari == 0) ? "${jam.abs()} Jam" : "${hari.abs()} Hari",
            tanggal: DateFormat.yMEd('id').format(e.tanggal!),
            color: (isLewat)
                ? Colors.red
                : (hari > 3)
                    ? Colors.green
                    : (hari > 1)
                        ? Colors.orange
                        : Colors.blue,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: CardCloud.height,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(seconds: 2),
        autoPlayInterval: Duration(seconds: 5),
        viewportFraction: 1,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
