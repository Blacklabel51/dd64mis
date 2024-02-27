part of konsumsi;

class PendapatanData {
  PendapatanData(
      {this.lapus,
      this.jenisPekerjaan,
      this.pUang,
      this.pBarang,
      this.pLainnya,
      this.kategori,
      this.harga,
      this.hargaSubsidi,
      this.satuanHarga,
      this.art,
      this.statusPendapatanData,
      this.banyak,
      this.nilai,
      this.nilairiil,
      this.catatan});
  String? lapus;
  String? jenisPekerjaan;
  String? pUang;
  String? pBarang;
  String? pLainnya;
  String? kategori;
  String? harga;
  String? hargaSubsidi;
  String? satuanHarga;
  String? art;
  String? statusPendapatanData;
  String? banyak;
  String? nilai;
  String? nilairiil;
  String? catatan;

  factory PendapatanData.fromJson(Map<String, dynamic> json) => PendapatanData(
        lapus: json["lapus"],
        jenisPekerjaan: json["jenisPekerjaan"],
        pUang: json["pUang"],
        pBarang: json["pBarang"],
        pLainnya: json["pLainnya"],
        kategori: json["kategori"],
        harga: json["harga"],
        hargaSubsidi: json["hargaSubsidi"],
        satuanHarga: json["satuanHarga"],
        art: json["art"],
        statusPendapatanData: json["statusPendapatanData"],
        banyak: json["banyak"],
        nilai: json["nilai"],
        nilairiil: json["nilairiil"],
        catatan: json["catatan"],
      );

  Map<String, dynamic> toJson() => {
        "lapus": lapus,
        "jenisPekerjaan": jenisPekerjaan,
        "pUang": pUang,
        "pBarang": pBarang,
        "pLainnya": pLainnya,
        "kategori": kategori,
        "harga": harga,
        "hargaSubsidi": hargaSubsidi,
        "satuanHarga": satuanHarga,
        "art": art,
        "statusPendapatanData": statusPendapatanData,
        "banyak": banyak,
        "nilai": nilai,
        "nilairiil": nilairiil,
        "catatan": catatan,
      };

  static List<PendapatanData> fromJsonList(List list) {
    if (list.isEmpty) return List<PendapatanData>.empty();
    return list.map((e) => PendapatanData.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<PendapatanData> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
