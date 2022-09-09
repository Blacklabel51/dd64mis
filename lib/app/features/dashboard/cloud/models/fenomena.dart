part of cloud;

class Fenomena {
  Fenomena({
    this.no,
    this.wilayah,
    this.fenomena,
    this.kategori,
    this.bekerja,
    this.pendapatan,
    this.pengangguran,
    this.bak,
    this.link,
    this.petugas,
    this.waktu,
    this.delete,
  });

  String? no;
  String? wilayah;
  String? fenomena;
  String? kategori;
  String? bekerja;
  String? pendapatan;
  String? pengangguran;
  String? bak;
  String? link;
  String? petugas;
  String? waktu;
  String? delete;

  factory Fenomena.fromJson(Map<String, dynamic> json) => Fenomena(
        no: json["no"],
        wilayah: json["wilayah"],
        fenomena: json["fenomena"],
        kategori: json["kategori"],
        bekerja: json["bekerja"],
        pendapatan: json["pendapatan"],
        pengangguran: json["pengangguran"],
        bak: json["bak"],
        link: json["link"],
        petugas: json["petugas"],
        waktu: json["waktu"],
        delete: json["delete"],
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "wilayah": wilayah,
        "fenomena": fenomena,
        "kategori": kategori,
        "bekerja": bekerja,
        "pendapatan": pendapatan,
        "pengangguran": pengangguran,
        "bak": bak,
        "link": link,
        "petugas": petugas,
        "waktu": waktu,
        "delete": delete,
      };
  factory Fenomena.kosong() => Fenomena(
      no: "",
      wilayah: "",
      fenomena: "",
      kategori: "",
      bekerja: "",
      pendapatan: "",
      pengangguran: "",
      bak: "",
      link: "",
      petugas: "",
      waktu: "",
      delete: "");

  static List<Fenomena> fromJsonList(List list) {
    if (list.isEmpty) return List<Fenomena>.empty();
    return list.map((e) => Fenomena.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Fenomena> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
