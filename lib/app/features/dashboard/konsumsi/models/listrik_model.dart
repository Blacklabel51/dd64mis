// part of 'models.dart';

class ListrikModel {
  String watt;
  String judul;
  double beban;
  double blok1;
  double blok2;
  double blok3;
  double batasblok1;
  double batasblok2;
  double prabayar;
  ListrikModel(this.watt, this.judul, this.beban, this.blok1, this.blok2,
      this.blok3, this.batasblok1, this.batasblok2, this.prabayar);
}

final List<ListrikModel> listrik = listrikData
    .map((item) => ListrikModel(
        item['watt'] as String,
        item['judul'] as String,
        item['beban'] as double,
        item['blok1'] as double,
        item['blok2'] as double,
        item['blok3'] as double,
        item['batasblok1'] as double,
        item['batasblok2'] as double,
        item['prabayar'] as double))
    .toList();

var listrikData = [
  {
    "watt": "450",
    "judul": "450",
    "beban": 4950.0,
    "blok1": 169.0,
    "blok2": 360.0,
    "blok3": 495.0,
    "batasblok1": 30.0,
    "batasblok2": 30.0,
    "prabayar": 415.0
  },
  {
    "watt": "900",
    "judul": "900 Subsidi",
    "beban": 18000.0,
    "blok1": 275.0,
    "blok2": 445.0,
    "blok3": 495.0,
    "batasblok1": 20.0,
    "batasblok2": 40.0,
    "prabayar": 605.0
  },
  {
    "watt": "900a",
    "judul": "900 NonSubsidi",
    "beban": 0.0,
    "blok1": 1352.0,
    "blok2": 0.0,
    "blok3": 0.0,
    "batasblok1": 10000.0,
    "batasblok2": 10000.0,
    "prabayar": 1352.0
  },
  {
    "watt": "1300",
    "judul": "1300",
    "beban": 0.0,
    "blok1": 1444.7,
    "blok2": 0.0,
    "blok3": 0.0,
    "batasblok1": 10000.0,
    "batasblok2": 10000.0,
    "prabayar": 1444.7
  },
  {
    "watt": "2200",
    "judul": "2200",
    "beban": 0.0,
    "blok1": 1444.7,
    "blok2": 0.0,
    "blok3": 0.0,
    "batasblok1": 10000.0,
    "batasblok2": 10000.0,
    "prabayar": 1444.7
  },
  {
    "watt": "3500",
    "judul": "3500",
    "beban": 0.0,
    "blok1": 1699.53,
    "blok2": 0.0,
    "blok3": 0.0,
    "batasblok1": 10000.0,
    "batasblok2": 10000.0,
    "prabayar": 1699.53
  },
];
