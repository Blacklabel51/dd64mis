part of konsumsi;

class KomoditiData {
  final String? no;
  final String? cocicop;
  final String? rincian;
  final String? satuan;
  final String? sub;
  final String? kelompok;
  final String? kategori;
  final int? digit;
  final String? custom;
  final String? lainnya;
  final String? waktu;
  final String? keterangan;
  final String? minHarga;
  final String? maxHarga;
  final String? protein;
  final String? maxProtein;
  final String? karbohidrat;
  final String? maxKarbohidrat;
  final String? istilah;
  final String? foto;

  KomoditiData({
    this.no,
    this.cocicop,
    this.rincian,
    this.satuan,
    this.sub,
    this.kelompok,
    this.kategori,
    this.waktu,
    this.digit,
    this.custom,
    this.lainnya,
    this.keterangan,
    this.minHarga,
    this.maxHarga,
    this.protein,
    this.maxProtein,
    this.karbohidrat,
    this.maxKarbohidrat,
    this.istilah,
    this.foto,
  });
  factory KomoditiData.fromJson(Map<String, dynamic> json) => KomoditiData(
        no: json["no"],
        cocicop: json["cocicop"],
        rincian: json["rincian"],
        satuan: json["satuan"],
        sub: json["sub"],
        kelompok: json["kelompok"],
        kategori: json["kategori"],
        digit: int.tryParse(json["digit"]) ?? 2,
        lainnya: json["lainnya"],
        custom: json["custom"],
        waktu: json["waktu"],
        keterangan: json["keterangan"],
        minHarga: json["minHarga"],
        maxHarga: json["maxHarga"],
        protein: json["protein"],
        maxProtein: json["maxProtein"],
        karbohidrat: json["karbohidrat"],
        maxKarbohidrat: json["maxKarbohidrat"],
        foto: json["foto"],
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "cocicop": cocicop,
        "rincian": rincian,
        "satuan": satuan,
        "sub": sub,
        "kelompok": kelompok,
        "kategori": kategori,
        "digit": digit,
        "lainnya": lainnya,
        "custom": custom,
        "waktu": waktu,
        "keterangan": keterangan,
        "minHarga": minHarga,
        "maxHarga": maxHarga,
        "protein": protein,
        "maxProtein": maxProtein,
        "karbohidrat": karbohidrat,
        "maxKarbohidrat": maxKarbohidrat,
        "foto": foto,
      };

  static List<KomoditiData> fromJsonList(List list) {
    if (list.isEmpty) return List<KomoditiData>.empty();
    return list.map((e) => KomoditiData.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<KomoditiData> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
