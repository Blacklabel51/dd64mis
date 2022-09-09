part of konsumsi;

class Art {
  final String? nama;
  final int? nks;
  final int? noRuta;

  Art({this.nama, this.nks, this.noRuta});
  factory Art.fromJson(Map<String, dynamic> json) =>
      Art(nama: json["nama"], nks: json["nks"], noRuta: json["noRuta"]);

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "nks": nks,
        "noRuta": noRuta,
      };

  static List<Art> fromJsonList(List list) {
    if (list.isEmpty) return List<Art>.empty();
    return list.map((e) => Art.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Art> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
