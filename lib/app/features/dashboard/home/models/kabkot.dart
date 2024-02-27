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
        pPemutakhiran: double.tryParse(json["pPemutakhiran"]) ?? 0,
        pPencacahan: double.tryParse(json["pPencacahan"]) ?? 0,
        pOlah: double.tryParse(json["pOlah"]) ?? 0,
        pPemeriksaan: double.tryParse(json["pPemeriksaan"]) ?? 0,
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
    if (list.isEmpty) return List<Kabupaten>.empty();
    return list.map((e) => Kabupaten.fromJson(e)).toList();
  }
}
