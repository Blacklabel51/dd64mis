part of cloud;

class Petugas {
  Petugas(
      {this.kodePetugas,
      this.kabkota,
      this.nama,
      this.status,
      this.kodekabkota,
      this.pPemutakhiran,
      this.pPencacahan,
      this.pPemeriksaan,
      this.pDokClean,
      this.pTerima,
      this.pOlah});

  String? kodePetugas;
  String? kabkota;
  String? nama;
  String? status;
  String? kodekabkota;
  double? pPemutakhiran;
  double? pPencacahan;
  double? pPemeriksaan;
  double? pDokClean;
  double? pTerima;
  double? pOlah;

  factory Petugas.fromJson(Map<String, dynamic> json) => Petugas(
        kodePetugas: json["kodePetugas"] ?? '',
        kabkota: json["kabkota"] ?? '',
        nama: json["nama"] ?? '',
        status: json["status"] ?? '',
        kodekabkota: json["kodekabkota"] ?? '',
        pPemutakhiran: double.tryParse(json["pPemutakhiran"]) ?? 0,
        pPencacahan: double.tryParse(json["pPencacahan"]) ?? 0,
        pPemeriksaan: double.tryParse(json["pPemeriksaan"]) ?? 0,
        pDokClean: double.tryParse(json["pDokClean"]) ?? 0,
        pTerima: double.tryParse(json["pTerima"]) ?? 0,
        pOlah: double.tryParse(json["pOlah"]) ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "kodePetugas": kodePetugas,
        "kabkota": kabkota,
        "nama": nama,
        "status": status,
        "kodekabkota": kodekabkota,
        "pPemutakhiran": pPemutakhiran.toString(),
        "pPencacahan": pPencacahan.toString(),
        "pPemeriksaan": pPemeriksaan.toString(),
        "pDokClean": pDokClean.toString(),
        "pTerima": pTerima.toString(),
        "pOlah": pOlah.toString(),
      };

  static List<Petugas> fromJsonList(List list) {
    if (list.isEmpty) return List<Petugas>.empty();
    return list.map((e) => Petugas.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Petugas> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
