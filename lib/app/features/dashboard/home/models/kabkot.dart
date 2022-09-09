part of home;

class Kabupaten {
  Kabupaten({
    this.no,
    this.kabkota,
    this.pPemutakhiran,
    this.pPencacahan,
    this.pOlah,
    this.pPemeriksaan,
  });

  String? no;
  String? kabkota;
  double? pPemutakhiran;
  double? pPencacahan;
  double? pOlah;
  double? pPemeriksaan;

  factory Kabupaten.fromJson(Map<String, dynamic> json) => Kabupaten(
        no: json["no"],
        kabkota: json["kabkota"],
        pPemutakhiran: double.parse(json["pPemutakhiran"]),
        pPencacahan: double.parse(json["pPencacahan"]),
        pOlah: double.parse(json["pOlah"]),
        pPemeriksaan: double.parse(json["pPemeriksaan"]),
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "kabkota": kabkota,
        "pPemutakhiran": pPemutakhiran,
        "pPencacahan": pPencacahan,
        "pOlah": pOlah,
        "pPemeriksaan": pPemeriksaan,
      };

  static List<Kabupaten> fromJsonList(List list) {
    if (list.length == 0) return List<Kabupaten>.empty();
    return list.map((e) => Kabupaten.fromJson(e)).toList();
  }
}
