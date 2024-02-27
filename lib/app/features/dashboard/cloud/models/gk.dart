part of cloud;

class Gk {
  Gk({
    this.kode,
    this.kabkota,
    this.gk2022,
  });

  String? kode;
  String? kabkota;
  String? gk2022;

  factory Gk.fromJson(Map<String, dynamic> json) => Gk(
        kode: json["kode"],
        kabkota: json["kabkota"],
        gk2022: json["gk2022"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "kabkota": kabkota,
        "gk2022": gk2022,
      };
  factory Gk.kosong() => Gk(
        kode: "",
        kabkota: "",
        gk2022: "",
      );

  static List<Gk> fromJsonList(List list) {
    if (list.isEmpty) return List<Gk>.empty();
    return list.map((e) => Gk.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Gk> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
