part of konsumsi;

class Konsumsi {
  Konsumsi(
      {this.nks,
      this.ruta,
      this.komoditi,
      this.banyakKonv,
      this.konversi,
      this.waktu,
      this.harga,
      this.hargaSubsidi,
      this.satuanHarga,
      this.art,
      this.statusKonsumsi,
      this.banyak,
      this.nilai,
      this.nilairiil,
      this.catatan});
  String? nks;
  String? ruta;
  String? komoditi;
  String? banyakKonv;
  String? konversi;
  String? waktu;
  String? harga;
  String? hargaSubsidi;
  String? satuanHarga;
  String? art;
  String? statusKonsumsi;
  String? banyak;
  String? nilai;
  String? nilairiil;
  String? catatan;

  factory Konsumsi.fromJson(Map<String, dynamic> json) => Konsumsi(
        nks: json["nks"],
        ruta: json["ruta"],
        komoditi: json["komoditi"],
        banyakKonv: json["banyakKonv"],
        konversi: json["konversi"],
        waktu: json["waktu"],
        harga: json["harga"],
        hargaSubsidi: json["hargaSubsidi"],
        satuanHarga: json["satuanHarga"],
        art: json["art"],
        statusKonsumsi: json["statusKonsumsi"],
        banyak: json["banyak"],
        nilai: json["nilai"],
        nilairiil: json["nilairiil"],
        catatan: json["catatan"],
      );

  Map<String, dynamic> toJson() => {
        "nks": nks,
        "ruta": ruta,
        "komoditi": komoditi,
        "banyakKonv": banyakKonv,
        "konversi": konversi,
        "waktu": waktu,
        "harga": harga,
        "hargaSubsidi": hargaSubsidi,
        "satuanHarga": satuanHarga,
        "art": art,
        "statusKonsumsi": statusKonsumsi,
        "banyak": banyak,
        "nilai": nilai,
        "nilairiil": nilairiil,
        "catatan": catatan,
      };

  static List<Konsumsi> fromJsonList(List list) {
    if (list.isEmpty) return List<Konsumsi>.empty();
    return list.map((e) => Konsumsi.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Konsumsi> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
