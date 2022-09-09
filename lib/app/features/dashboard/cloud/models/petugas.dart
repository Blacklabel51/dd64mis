part of cloud;

class Petugas {
  Petugas(
      {this.kodePetugas,
      this.kabkota,
      this.nama,
      this.status,
      this.kodekabkota,
      this.pemutakhiran,
      this.pencacahan,
      this.pemeriksaan});

  String? kodePetugas;
  String? kabkota;
  String? nama;
  String? status;
  String? kodekabkota;
  double? pemutakhiran;
  double? pencacahan;
  double? pemeriksaan;

  factory Petugas.fromJson(Map<String, dynamic> json) => Petugas(
        kodePetugas: json["kodePetugas"],
        kabkota: json["kabkota"],
        nama: json["nama"],
        status: json["status"],
        kodekabkota: json["kodekabkota"],
        pemutakhiran: double.tryParse(json["pemutakhiran"]) ?? 0,
        pencacahan: double.tryParse(json["pencacahan"]) ?? 0,
        pemeriksaan: double.tryParse(json["pemeriksaan"]) ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "kodePetugas": kodePetugas,
        "kabkota": kabkota,
        "nama": nama,
        "status": status,
        "kodekabkota": kodekabkota,
        "pemutakhiran": pemutakhiran.toString(),
        "pencacahan": pencacahan.toString(),
        "pemeriksaan": pemeriksaan.toString(),
      };

  static List<Petugas> fromJsonList(List list) {
    if (list.length == 0) return List<Petugas>.empty();
    return list.map((e) => Petugas.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Petugas> list) {
    if (list.length == 0) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
