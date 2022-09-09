part of home;

class Jadwal {
  Jadwal({
    this.no,
    this.tanggal,
    this.keterangan,
  });

  String? no;
  DateTime? tanggal;
  String? keterangan;
  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        no: json["no"],
        tanggal: DateTime(1899, 12, 30)
            .add(Duration(days: int.parse(json["tanggal"]))),
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "tanggal": tanggal,
        "keterangan": keterangan,
      };

  static List<Jadwal> fromJsonList(List list) {
    if (list.isEmpty) return List<Jadwal>.empty();
    return list.map((e) => Jadwal.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Jadwal> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
