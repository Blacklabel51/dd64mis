// part of 'models.dart';

class Air {
  String judul;
  int beban;
  int blok1;
  int blok2;
  int blok3;
  int blok4;
  int batasblok1;
  int batasblok2;
  int batasblok3;
  Air(this.judul, this.beban, this.blok1, this.blok2, this.blok3, this.blok4,
      this.batasblok1, this.batasblok2, this.batasblok3);
}

final List<Air> airs = airData
    .map((item) => Air(
        item['judul'] as String,
        item['beban'] as int,
        item['blok1'] as int,
        item['blok2'] as int,
        item['blok3'] as int,
        item['blok4'] as int,
        item['batasblok1'] as int,
        item['batasblok2'] as int,
        item['batasblok3'] as int))
    .toList();

var airData = [
  {
    "judul": "Rumah Tangga 1",
    "beban": 7500,
    "blok1": 750,
    "blok2": 1050,
    "blok3": 1200,
    "blok4": 1800,
    "batasblok1": 15,
    "batasblok2": 25,
    "batasblok3": 35,
  },
  {
    "judul": "Rumah Tangga 2",
    "beban": 7500,
    "blok1": 900,
    "blok2": 1200,
    "blok3": 1500,
    "blok4": 2100,
    "batasblok1": 15,
    "batasblok2": 25,
    "batasblok3": 35,
  },
  {
    "judul": "Rumah Tangga 3",
    "beban": 7500,
    "blok1": 1200,
    "blok2": 1500,
    "blok3": 1800,
    "blok4": 2400,
    "batasblok1": 15,
    "batasblok2": 25,
    "batasblok3": 35,
  }
];
