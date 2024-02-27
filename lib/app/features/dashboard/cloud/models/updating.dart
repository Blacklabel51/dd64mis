part of cloud;

class Updating {
  Updating({
    this.no,
    this.kabkota,
    this.nks,
    this.kodePcl,
    this.kodePml,
    this.sPemutakhiran,
    this.keluargaAwal,
    this.keluargaUpdate,
    this.rutaUpdate,
    this.desa,
    this.bs,
    this.sls,
    this.seruti,
  });

  String? no;
  String? kabkota;
  String? nks;
  String? kodePcl;
  String? kodePml;
  String? sPemutakhiran;
  String? keluargaAwal;
  String? keluargaUpdate;
  String? rutaUpdate;
  String? desa;
  String? bs;
  String? sls;
  String? seruti;

  factory Updating.fromJson(Map<String, dynamic> json) => Updating(
        no: json["no"],
        kabkota: json["kabkota"],
        nks: json["nks"],
        kodePcl: json["kodePcl"],
        kodePml: json["kodePml"],
        sPemutakhiran: json["sPemutakhiran"],
        keluargaAwal: json["keluargaAwal"],
        keluargaUpdate: json["keluargaUpdate"],
        rutaUpdate: json["rutaUpdate"],
        desa: json["desa"],
        bs: json["bs"],
        sls: json["sls"],
        seruti: json["seruti"],
      );

  factory Updating.conv(Updating updating, Map<String, dynamic> values) =>
      Updating(
        no: updating.no,
        kabkota: updating.kabkota,
        nks: updating.nks,
        kodePcl: updating.kodePcl,
        kodePml: updating.kodePml,
        sPemutakhiran: updating.sPemutakhiran,
        keluargaAwal: updating.keluargaAwal,
        keluargaUpdate: updating.keluargaUpdate,
        rutaUpdate: updating.rutaUpdate,
        desa: updating.desa,
        bs: updating.bs,
        sls: updating.sls,
        seruti: updating.seruti,
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "kabkota": kabkota,
        "nks": nks,
        "kodePcl": kodePcl,
        "kodePml": kodePml,
        "sPemutakhiran": sPemutakhiran,
        "keluargaAwal": keluargaAwal,
        "keluargaUpdate": keluargaUpdate,
        "rutaUpdate": rutaUpdate,
        "desa": desa,
        "bs": bs,
        "sls": sls,
        "seruti": seruti,
      };

  static List<Updating> fromJsonList(List list) {
    if (list.isEmpty) return List<Updating>.empty();
    return list.map((e) => Updating.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Updating> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
