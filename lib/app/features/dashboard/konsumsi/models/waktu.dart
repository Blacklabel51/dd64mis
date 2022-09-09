part of konsumsi;

class WaktuData {
  final String? waktu;
  final int? hari;

  WaktuData({
    this.waktu,
    this.hari,
  });
  factory WaktuData.fromJson(Map<String, dynamic> json) => WaktuData(
        waktu: json["waktu"],
        hari: int.parse(json["hari"]),
      );

  Map<String, dynamic> toJson() => {
        "waktu": waktu,
        "hari": hari,
      };

  static List<WaktuData> fromJsonList(List list) {
    if (list.isEmpty) return List<WaktuData>.empty();
    return list.map((e) => WaktuData.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<WaktuData> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
