part of kode;

class Kode {
  Kode(
      {this.no,
      this.pekerjaan,
      this.kbli,
      this.kbji,
      this.contoh,
      this.catatan,
      this.pertanyaan,
      this.tanggapan,
      this.status,
      this.user});

  String? no;
  String? pekerjaan;
  String? kbli;
  String? kbji;
  String? contoh;
  String? catatan;
  String? pertanyaan;
  String? tanggapan;
  String? status;
  String? user;

  factory Kode.fromJson(Map<String, dynamic> json) => Kode(
        no: json["no"],
        pekerjaan: json["pekerjaan"],
        kbli: json["kbli"],
        kbji: json["kbji"],
        contoh: json["contoh"],
        catatan: json["catatan"],
        pertanyaan: json["pertanyaan"],
        tanggapan: json["tanggapan"],
        status: json["status"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "pekerjaan": pekerjaan,
        "kbli": kbli,
        "kbji": kbji,
        "contoh": contoh,
        "catatan": catatan,
        "pertanyaan": pertanyaan,
        "tanggapan": tanggapan,
        "status": status,
        "user": user,
      };

  static List<Kode> fromJsonList(List list) {
    if (list.length == 0) return List<Kode>.empty();
    return list.map((e) => Kode.fromJson(e)).toList();
  }
}
