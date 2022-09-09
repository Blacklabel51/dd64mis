part of konsumsi;

class Konversi {
  final String? komoditi, nama, foto, satuan, keterangan;
  final double? konversi;

  Konversi({
    this.komoditi,
    this.nama,
    this.konversi,
    this.foto,
    this.satuan,
    this.keterangan,
  });
  factory Konversi.fromJson(Map<String, dynamic> json) => Konversi(
        komoditi: json["komoditi"],
        nama: json["nama"],
        konversi: double.tryParse(json["konversi"]),
        foto: json["foto"],
        satuan: json["satuan"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "komoditi": komoditi,
        "nama": nama,
        "konversi": konversi,
        "foto": foto,
        "satuan": satuan,
        "keterangan": keterangan,
      };

  static List<Konversi> fromJsonList(List list) {
    if (list.isEmpty) return List<Konversi>.empty();
    return list.map((e) => Konversi.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Konversi> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
