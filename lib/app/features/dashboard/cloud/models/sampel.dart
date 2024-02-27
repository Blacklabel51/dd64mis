part of cloud;

class Sampel {
  Sampel({
    this.no,
    this.kabkota,
    this.nks,
    this.ruta,
    this.namaRuta,
    this.kodePcl,
    this.kodePml,
    this.sPemutakhiran,
    this.keluargaAwal,
    this.keluargaUpdate,
    this.rutaUpdate,
    this.sPencacahan,
    this.sPemeriksaan,
    this.sDokClean,
    this.sOlah,
    this.sMiskin,
    this.miskin,
    this.desa,
    this.bs,
    this.art,
    this.komoditasMakan,
    this.komoditasNonmakan,
    this.balita = false,
    this.wanitaSubur = false,
    this.supir = false,
    this.berobat = false,
    this.obatSendiri = false,
    this.internet = false,
    this.tabungan = false,
    this.sekolah = false,
    this.hp = false,
    this.pegawai = false,
    this.berusaha = false,
    this.merokok = false,
    this.bermotor = false,
    this.ledeng = false,
    this.bansos = false,
    this.lpg = false,
    this.kb = false,
    this.asuransi = false,
    this.namaArt,
    this.sls,
  });

  String? no;
  String? kabkota;
  String? nks;
  String? ruta;
  String? namaRuta;
  String? kodePcl;
  String? kodePml;
  String? sPemutakhiran;
  String? keluargaAwal;
  String? keluargaUpdate;
  String? rutaUpdate;
  String? sPencacahan;
  String? sPemeriksaan;
  String? sOlah;
  String? sDokClean;
  String? sMiskin;
  String? miskin;
  String? desa;
  String? bs;
  String? art;
  String? komoditasMakan;
  String? komoditasNonmakan;
  bool balita;
  bool wanitaSubur;
  bool supir;
  bool berobat;
  bool obatSendiri;
  bool internet;
  bool tabungan;
  bool sekolah;
  bool hp;
  bool pegawai;
  bool berusaha;
  bool merokok;
  bool bermotor;
  bool ledeng;
  bool bansos;
  bool lpg;
  bool kb;
  bool asuransi;
  List<String>? namaArt;
  String? sls;

  factory Sampel.fromJson(Map<String, dynamic> json) => Sampel(
      no: json["no"],
      kabkota: json["kabkota"],
      nks: json["nks"],
      ruta: json["ruta"],
      namaRuta: json["namaRuta"],
      kodePcl: json["kodePcl"],
      kodePml: json["kodePml"],
      sPemutakhiran: json["sPemutakhiran"],
      keluargaAwal: json["keluargaAwal"],
      keluargaUpdate: json["keluargaUpdate"],
      rutaUpdate: json["rutaUpdate"],
      sPencacahan: json["sPencacahan"],
      sPemeriksaan: json["sPemeriksaan"],
      sDokClean: json["sDokClean"],
      sOlah: json["sOlah"],
      sMiskin: json["sMiskin"],
      miskin: json["miskin"],
      desa: json["desa"],
      bs: json["bs"],
      art: json["art"],
      sls: json["sls"],
      komoditasMakan: json["komoditasMakan"],
      komoditasNonmakan: json["komoditasNonmakan"],
      balita: json['balita'].toString().toLowerCase() == "true",
      wanitaSubur: json['wanitaSubur'].toString().toLowerCase() == "true",
      supir: json['supir'].toString().toLowerCase() == "true",
      berobat: json['berobat'].toString().toLowerCase() == "true",
      obatSendiri: json['obatSendiri'].toString().toLowerCase() == "true",
      internet: json['internet'].toString().toLowerCase() == "true",
      tabungan: json['tabungan'].toString().toLowerCase() == "true",
      sekolah: json['sekolah'].toString().toLowerCase() == "true",
      hp: json['hp'].toString().toLowerCase() == "true",
      pegawai: json['pegawai'].toString().toLowerCase() == "true",
      berusaha: json['berusaha'].toString().toLowerCase() == "true",
      merokok: json['merokok'].toString().toLowerCase() == "true",
      bermotor: json['bermotor'].toString().toLowerCase() == "true",
      ledeng: json['ledeng'].toString().toLowerCase() == "true",
      bansos: json['bansos'].toString().toLowerCase() == "true",
      lpg: json['lpg'].toString().toLowerCase() == "true",
      kb: json['kb'].toString().toLowerCase() == "true",
      asuransi: json['asuransi'].toString().toLowerCase() == "true",
      namaArt: (json['namaArt'] == "")
          ? <String>[]
          : json['namaArt'].toString().trim().split(","));

  factory Sampel.conv(Sampel sampel, Map<String, dynamic> values) => Sampel(
        no: sampel.no,
        kabkota: sampel.kabkota,
        nks: sampel.nks,
        ruta: sampel.ruta,
        namaRuta: sampel.namaRuta,
        kodePcl: sampel.kodePcl,
        kodePml: sampel.kodePml,
        sPemutakhiran: sampel.sPemutakhiran,
        keluargaAwal: sampel.keluargaAwal,
        keluargaUpdate: sampel.keluargaUpdate,
        rutaUpdate: sampel.rutaUpdate,
        sPencacahan: sampel.sPencacahan,
        sPemeriksaan: sampel.sPemeriksaan,
        sDokClean: sampel.sDokClean,
        sOlah: sampel.sOlah,
        sMiskin: sampel.sMiskin,
        miskin: sampel.miskin,
        desa: sampel.desa,
        bs: sampel.bs,
        art: sampel.art,
        sls: sampel.sls,
        komoditasMakan: sampel.komoditasMakan,
        komoditasNonmakan: sampel.komoditasNonmakan,
        balita: (values["balita"] == null) ? sampel.balita : values["balita"],
        wanitaSubur: (values["wanitaSubur"] == null)
            ? sampel.wanitaSubur
            : values["wanitaSubur"],
        supir: (values["supir"] == null) ? sampel.supir : values["supir"],
        berobat:
            (values["berobat"] == null) ? sampel.berobat : values["berobat"],
        obatSendiri: (values["obatSendiri"] == null)
            ? sampel.obatSendiri
            : values["obatSendiri"],
        internet:
            (values["internet"] == null) ? sampel.internet : values["internet"],
        tabungan:
            (values["tabungan"] == null) ? sampel.tabungan : values["tabungan"],
        sekolah:
            (values["sekolah"] == null) ? sampel.sekolah : values["sekolah"],
        hp: (values["hp"] == null) ? sampel.hp : values["hp"],
        pegawai:
            (values["pegawai"] == null) ? sampel.pegawai : values["pegawai"],
        berusaha:
            (values["berusaha"] == null) ? sampel.berusaha : values["berusaha"],
        merokok:
            (values["merokok"] == null) ? sampel.merokok : values["merokok"],
        bermotor:
            (values["bermotor"] == null) ? sampel.bermotor : values["bermotor"],
        ledeng: (values["ledeng"] == null) ? sampel.ledeng : values["ledeng"],
        bansos: (values["bansos"] == null) ? sampel.bansos : values["bansos"],
        lpg: (values["lpg"] == null) ? sampel.lpg : values["lpg"],
        kb: (values["kb"] == null) ? sampel.kb : values["kb"],
        asuransi:
            (values["asuransi"] == null) ? sampel.asuransi : values["asuransi"],
        namaArt: (values["namaArt"] == null)
            ? sampel.namaArt
            : values['namaArt'].toString().trim().split(","),
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "kabkota": kabkota,
        "nks": nks,
        "ruta": ruta,
        "namaRuta": namaRuta,
        "kodePcl": kodePcl,
        "kodePml": kodePml,
        "sPemutakhiran": sPemutakhiran,
        "keluargaAwal": keluargaAwal,
        "keluargaUpdate": keluargaUpdate,
        "rutaUpdate": rutaUpdate,
        "sPencacahan": sPencacahan,
        "sPemeriksaan": sPemeriksaan,
        "sDokClean": sDokClean,
        "sOlah": sOlah,
        "sMiskin": sMiskin,
        "miskin": miskin,
        "desa": desa,
        "bs": bs,
        "art": art,
        "komoditasMakanan": komoditasMakan,
        "komoditasNonmakan": komoditasNonmakan,
        'balita': balita,
        'wanitaSubur': wanitaSubur,
        'supir': supir,
        'berobat': berobat,
        'obatSendiri': obatSendiri,
        'internet': internet,
        'tabungan': tabungan,
        'sekolah': sekolah,
        'hp': hp,
        'pegawai': pegawai,
        'berusaha': berusaha,
        'merokok': merokok,
        'bermotor': bermotor,
        'ledeng': ledeng,
        'bansos': bansos,
        'lpg': lpg,
        'kb': kb,
        'asuransi': asuransi,
        'namaArt': namaArt,
        'sls': sls
      };

  static List<Sampel> fromJsonList(List list) {
    if (list.isEmpty) return List<Sampel>.empty();
    return list.map((e) => Sampel.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Sampel> list) {
    if (list.isEmpty) return List<Map<String, dynamic>>.empty();
    return list.map((e) => e.toJson()).toList();
  }
}
