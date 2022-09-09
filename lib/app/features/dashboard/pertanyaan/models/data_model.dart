class Pertanyaan {
  String? id;
  String? pertanyaan;
  String? ketPertanyaan;
  String? jenisPertanyaan;
  String? rincian;
  String? keterangan;
  String? petugas;

  Pertanyaan(
      {this.id,
      this.pertanyaan,
      this.ketPertanyaan,
      this.jenisPertanyaan,
      this.rincian,
      this.keterangan,
      this.petugas});

  Pertanyaan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pertanyaan = json['pertanyaan'];
    ketPertanyaan = json['ketPertanyaan'];
    jenisPertanyaan = json['jenisPertanyaan'];
    rincian = json['rincian'];
    keterangan = json['keterangan'];
    petugas = json['petugas'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['pertanyaan'] = pertanyaan;
    data['ketPertanyaan'] = ketPertanyaan;
    data['jenisPertanyaan'] = jenisPertanyaan;
    data['rincian'] = rincian;
    data['keterangan'] = keterangan;
    data['petugas'] = petugas;
    return data;
  }

  static List<Pertanyaan> fromJsonList(List list) {
    if (list.isEmpty) return List<Pertanyaan>.empty();
    return list.map((e) => Pertanyaan.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Pertanyaan> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
