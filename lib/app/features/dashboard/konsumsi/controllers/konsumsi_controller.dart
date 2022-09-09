part of konsumsi;
// final Worksheet? datasheets;

class KonsumsiController extends GetxController {
  var listkomoditi = List<KomoditiData>.empty();
  var listWaktu = List<WaktuData>.empty();
  var listKonversi = List<Konversi>.empty();
  var filterlistKonversi = List<Konversi>.empty();
  var filterlistKonversiNon = List<Konversi>.empty();
  var filterlistkomoditi = List<KomoditiData>.empty();
  var filterlistkomoditiNonMakan = List<KomoditiData>.empty();
  var filterlistkomoditiNonMakanAll = List<KomoditiData>.empty();
  var komoditiTerpilih = KomoditiData();
  var rutaTerpilih = Sampel();
  var konsumsiTerpilih = List<Konsumsi>.empty();
  var filterkonsumsiTerpilih = List<Konsumsi>.empty();
  var dataSampel = List<Sampel>.empty();
  late Spreadsheet? spreadsheets;
  late Worksheet? datasheets;
  var petugasTerpilih = Petugas();
  final box = GetStorage();
  int indKom = 0;
  int indArt = -1;
  final Map<String, dynamic> values = {};
  Map<String, dynamic> rutaTerpilihMap = {};
  Konsumsi inputKonsumsi = Konsumsi();
  String statusKonsumsi = "";
  String artPilihan = "";
  String layananPln = "";
  String tarifair = "";
  String watts = "";
  String bnykkwh = "";
  String bnykmkubik = "";
  int artPilihanInd = 0;
  late WaktuData waktu;
  late Konversi konversi;
  late Konversi satuanHarga;
  TextEditingController banyakText = TextEditingController();
  TextEditingController hargaText = TextEditingController();
  TextEditingController hargaSubsidiText = TextEditingController();
  TextEditingController catatanText = TextEditingController();
  TextEditingController artText = TextEditingController();
  TextEditingController cariMakanan = TextEditingController();
  TextEditingController oopText = TextEditingController();
  PageController komoditiHalamaanCtrl = PageController(initialPage: 0);

  var daftarPertanyaanRuta = List<Pertanyaan>.empty();

  late FocusNode banyakNode;
  late FocusNode hargaNode;
  late FocusNode catatanNode;
  late FocusNode cPengeluaranNode;
  late FocusNode cOopNode;
  bool isExpanded = false;
  bool editKonsumsi = false;
  int indexk = -1;
  Konsumsi editDataKonsumsi = Konsumsi();
  @override
  void onInit() async {
    cariMakanan = TextEditingController();
    banyakNode = FocusNode();
    hargaNode = FocusNode();
    catatanNode = FocusNode();
    cPengeluaranNode = FocusNode();
    cOopNode = FocusNode();
    waktu = WaktuData();
    konversi = Konversi();
    satuanHarga = Konversi();
    try {
      getData();
      listkomoditi = KomoditiData.fromJsonList(box.read("komoditi"));
      filterlistkomoditi = listkomoditi
          .where((element) => element.kategori != "nonmakanan")
          .toList();
      log("cecek ${filterlistkomoditi.length.toString()}");
      filterlistkomoditiNonMakan = listkomoditi
          .where((element) =>
              element.kategori == "nonmakanan" && element.kelompok == "rincian")
          .toList();
      update();
    } catch (e) {
      getData();
    }
    try {
      petugasTerpilih = Petugas.fromJson(box.read("petugasTerpilih"));
      update();
    } catch (e) {
      log('Belum ada data $e');
    }
    try {
      dataSampel = Sampel.fromJsonList(box.read("sampelTerpilih"));
      var cek = dataSampel.where((e) => e.nks == rutaTerpilih.nks).isNotEmpty;
      if (cek) {
        rutaTerpilih = Sampel.fromJson(box.read("rutaTerpilih"));
        rutaTerpilihMap = rutaTerpilih.toJson();
      } else {
        rutaTerpilih = Sampel();
        rutaTerpilihMap = {};
      }

      update();
    } catch (e) {
      log('Belum ada data rutaTerpilih$e');
    }
    try {
      // getWaktu();
      listWaktu = WaktuData.fromJsonList(box.read("waktu"));
      update();
    } catch (e) {
      getWaktu();
      log('Belum ada data waktu$e');
    }
    try {
      getKonversi();
    } catch (e) {
      listKonversi = Konversi.fromJsonList(box.read("konversi"));
      update();

      log('pakai data Konversi lama$e');
    }
    try {
      konsumsiTerpilih = Konsumsi.fromJsonList(
          box.read("${rutaTerpilih.nks}-${rutaTerpilih.ruta}"));
      update();
    } catch (e) {
      konsumsiTerpilih = List<Konsumsi>.empty();
      update();
      log("Belum Ada Data Konsumsi ${rutaTerpilih.nks}-${rutaTerpilih.ruta}");
    }
    try {
      daftarPertanyaanRuta =
          Pertanyaan.fromJsonList(box.read("daftarPertanyaanRuta"));
      update();
    } catch (e) {
      getPertanyaan();
    }
    super.onInit();
  }

  @override
  void dispose() {
    print('dispose');
    cariMakanan.dispose();
    super.dispose();
  }

  void getData() async {
    try {
      spreadsheets = await GSheets(ApiPath.credential)
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
      datasheets = spreadsheets!.worksheetByTitle('komoditi');
      final komoditi = await datasheets!.values.map.allRows() as List<dynamic>;
      listkomoditi = KomoditiData.fromJsonList(komoditi);
      filterlistkomoditi = listkomoditi
          .where((element) => element.kategori != "nonmakanan")
          .toList();
      filterlistkomoditiNonMakan = listkomoditi
          .where((element) =>
              element.kategori == "nonmakanan" && element.kelompok == "rincian")
          .toList();
      box.write("komoditi", komoditi);
      update();
    } catch (e) {
      log('Error Ambil Data Komoditi: $e');
    }
  }

  void getWaktu() async {
    try {
      spreadsheets = await GSheets(ApiPath.credential)
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
      datasheets = spreadsheets!.worksheetByTitle('waktu');
      final waktu = await datasheets!.values.map.allRows() as List<dynamic>;
      listWaktu = WaktuData.fromJsonList(waktu);
      box.write("waktu", waktu);
      update();
    } catch (e) {
      log('Error Ambil Data Waktu: $e');
    }
  }

  void getKonversi() async {
    try {
      spreadsheets = await GSheets(ApiPath.credential)
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
      datasheets = spreadsheets!.worksheetByTitle('konversi');
      final konversi = await datasheets!.values.map.allRows() as List<dynamic>;
      listKonversi = Konversi.fromJsonList(konversi);
      box.write("konversi", konversi);
      update();
    } catch (e) {
      log('Error Ambil Data Konversi: $e');
    }
  }

  void search(String kodeCari) {
    if (kodeCari.isNotEmpty) {
      filterlistkomoditi = filterlistkomoditi
          .where((data) =>
              ((data.rincian != null)
                  ? data.rincian!.toLowerCase().contains(kodeCari)
                  : false) ||
              ((data.satuan != null)
                  ? data.satuan!.toLowerCase().contains(kodeCari)
                  : false))
          .toList();
      update();
    } else {
      filterlistkomoditi = filterlistkomoditi;
      update();
    }
  }

  void simpanArt() async {
    values["namaArt"] = rutaTerpilih.namaArt!.join(",");
    values.update("namaArt", (_) => rutaTerpilih.namaArt!.join(","));
    values["art"] = rutaTerpilih.namaArt!.length;
    values.update("art", (_) => rutaTerpilih.namaArt!.length);
    rutaTerpilih = Sampel.conv(rutaTerpilih, values);
    final gsheets = GSheets(ApiPath.credential);
    final spreadsheets = await gsheets
        .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
    var datasheetSampel = spreadsheets.worksheetByTitle('sampel')!;
    await datasheetSampel.values.map.insertRowByKey(
      rutaTerpilih.no!,
      values,
    );
    dataSampel[dataSampel.indexWhere(
            (e) => e.nks == rutaTerpilih.nks && e.ruta == rutaTerpilih.ruta)] =
        rutaTerpilih;
    update();
    box.write("rutaTerpilih", rutaTerpilih.toJson());
    box.write("sampelTerpilih", Sampel.toJsonList(dataSampel));
  }

  void getSampel() async {
    try {
      final _gsheets = GSheets(ApiPath.credential);
      final spreadsheets = await _gsheets
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
      var datasheetSampel = spreadsheets.worksheetByTitle('sampel')!;
      final biodatas = await datasheetSampel.values.map.allRows()
          as List<Map<String, String>>;
      dataSampel = Sampel.fromJsonList(biodatas
          .where((e) => (petugasTerpilih.status == "PCL")
              ? (e["kodePcl"] == petugasTerpilih.kodePetugas &&
                  e["kabkota"] == petugasTerpilih.kodekabkota)
              : e["kodePml"] == petugasTerpilih.kodePetugas &&
                  e["kabkota"] == petugasTerpilih.kodekabkota)
          .toList());
      box.write("sampelTerpilih", dataSampel);
    } catch (e) {
      log('Init Error get Sampel: $e');
    }
  }

  void pilihRuta(String nks, String ruta) {
    try {
      rutaTerpilih =
          dataSampel.firstWhere((e) => e.nks == nks && e.ruta == ruta);
      rutaTerpilihMap = rutaTerpilih.toJson();
      box.write("rutaTerpilih", rutaTerpilih.toJson());
      update();
    } catch (e) {
      log("$e");
    }
    try {
      konsumsiTerpilih = Konsumsi.fromJsonList(box.read("$nks-$ruta"));
      update();
    } catch (e) {
      konsumsiTerpilih = List<Konsumsi>.empty();
      update();
      log("Belum Ada Data Konsumsi $nks-$ruta");
    }
  }

  KomoditiData inputKomoditi(int i) {
    indKom = i;
    komoditiTerpilih = filterlistkomoditi[i];
    filterkonsumsiTerpilih = konsumsiTerpilih
        .where((e) => e.komoditi == komoditiTerpilih.no)
        .toList();
    filterlistKonversi = [
      Konversi(nama: komoditiTerpilih.satuan, konversi: 1),
      ...listKonversi.where((e) => e.komoditi == komoditiTerpilih.no).toList()
    ];

    editKonsumsi = false;
    editDataKonsumsi = Konsumsi();
    update();
    return komoditiTerpilih;
  }

  KomoditiData inputKomoditiNon(int i) {
    indKom = i;
    komoditiTerpilih = filterlistkomoditiNonMakan[i];
    filterkonsumsiTerpilih = konsumsiTerpilih
        .where((e) => e.komoditi == komoditiTerpilih.no)
        .toList();
    filterlistKonversiNon =
        listKonversi.where((e) => e.komoditi == komoditiTerpilih.no).toList();
    editKonsumsi = false;
    editDataKonsumsi = Konsumsi();
    update();
    return komoditiTerpilih;
  }

  KomoditiData pindahKomoditi(int i) {
    komoditiTerpilih = filterlistkomoditi[i];
    // indKom = indKom + i;

    filterkonsumsiTerpilih = konsumsiTerpilih
        .where((e) => e.komoditi == komoditiTerpilih.no)
        .toList();
    filterlistKonversi = [
      Konversi(nama: komoditiTerpilih.satuan, konversi: 1),
      ...listKonversi.where((e) => e.komoditi == komoditiTerpilih.no).toList()
    ];
    clear();
    editKonsumsi = false;
    editDataKonsumsi = Konsumsi();
    update();
    return komoditiTerpilih;
  }

  KomoditiData pindahKomoditiNon(int i) {
    komoditiTerpilih = filterlistkomoditiNonMakan[i];
    // indKom = indKom + i;

    filterkonsumsiTerpilih = konsumsiTerpilih
        .where((e) => e.komoditi == komoditiTerpilih.no)
        .toList();
    clear();
    editKonsumsi = false;
    editDataKonsumsi = Konsumsi();
    update();
    return komoditiTerpilih;
  }

  void simpan() {
    var banyakHitung = (double.tryParse(banyakText.text) ??
            0 * ((konversi.konversi == null) ? 1 : konversi.konversi!)) /
        ((waktu.hari == null) ? 1 : waktu.hari! / 7);
    var nilaiHitung = banyakHitung *
        (int.tryParse(hargaText.text.replaceAll(",", "")) ?? 0) /
        ((satuanHarga.konversi == null) ? 1 : satuanHarga.konversi!);
    konsumsiTerpilih = [
      ...konsumsiTerpilih,
      (Konsumsi(
          nks: rutaTerpilih.nks,
          ruta: rutaTerpilih.ruta,
          banyakKonv: banyakText.text,
          harga: hargaText.text.replaceAll(",", ""),
          hargaSubsidi: hargaSubsidiText.text.replaceAll(",", ""),
          komoditi: komoditiTerpilih.no,
          statusKonsumsi: statusKonsumsi,
          waktu: (waktu.waktu == null) ? komoditiTerpilih.waktu : waktu.waktu,
          konversi: (konversi.konversi == null)
              ? komoditiTerpilih.satuan
              : konversi.nama,
          satuanHarga: (satuanHarga.konversi == null)
              ? komoditiTerpilih.satuan
              : satuanHarga.nama,
          banyak: banyakHitung.toStringAsFixed(komoditiTerpilih.digit ?? 2),
          nilai: nilaiHitung.round().toString(),
          art: artPilihan,
          catatan: catatanText.text))
    ];
    box.write("${rutaTerpilih.nks}-${rutaTerpilih.ruta}",
        Konsumsi.toJsonList(konsumsiTerpilih));
    filterkonsumsiTerpilih = konsumsiTerpilih
        .where((e) => e.komoditi == komoditiTerpilih.no)
        .toList();
    editDataKonsumsi = Konsumsi();
    update();
    log(konsumsiTerpilih.length.toString());
    log(konsumsiTerpilih
        .map((e) =>
            "${e.banyakKonv} ${e.harga} ${e.komoditi}-${e.statusKonsumsi}+${e.waktu}#${e.konversi}#${e.satuanHarga}")
        .toList()
        .toString());
  }

  void simpanNon(bool simpan) {
    var konversi = (layananPln != "") ? "$layananPln-$watts" : tarifair;
    var banyaak = (banyakText.text != "")
        ? banyakText.text
        : (bnykkwh != "")
            ? bnykkwh
            : bnykmkubik;

    var simpanini = Konsumsi(
        nks: rutaTerpilih.nks,
        ruta: rutaTerpilih.ruta,
        harga: hargaText.text.replaceAll(",", ""),
        hargaSubsidi: hargaSubsidiText.text.replaceAll(",", ""),
        komoditi: komoditiTerpilih.no,
        statusKonsumsi: statusKonsumsi,
        waktu: (waktu.waktu == null) ? komoditiTerpilih.waktu : waktu.waktu,
        konversi: konversi,
        banyak: banyaak,
        nilai: hargaText.text.replaceAll(",", ""),
        catatan: catatanText.text);

    if (simpan) {
      konsumsiTerpilih = [...konsumsiTerpilih, simpanini];
    } else {
      konsumsiTerpilih[indexk] = simpanini;
    }

    box.write("${rutaTerpilih.nks}-${rutaTerpilih.ruta}",
        Konsumsi.toJsonList(konsumsiTerpilih));
    filterkonsumsiTerpilih = konsumsiTerpilih
        .where((e) => e.komoditi == komoditiTerpilih.no)
        .toList();
    editDataKonsumsi = Konsumsi();
    clear();
    update();
  }

  void updateKonsumsi() {
    var banyakHitung = (double.parse(banyakText.text) *
            ((konversi.konversi == null) ? 1 : konversi.konversi!)) /
        ((waktu.hari == null) ? 1 : waktu.hari! / 7);

    var nilaiHitung = banyakHitung *
        int.parse(hargaText.text.replaceAll(",", "")) /
        ((satuanHarga.konversi == null) ? 1 : satuanHarga.konversi!);
  }

  void kwh() {
    try {
      var biaya = int.parse(hargaText.text.replaceAll(",", ""));
      var watt = listrik.firstWhere((e) => e.judul == watts);
      if (layananPln != "" && watts != "" && hargaText.text != "") {
        if (layananPln == "pra") {
          bnykkwh = ((biaya / 1.08) / watt.prabayar).toStringAsFixed(1);
        } else {
          var pemakaian = (biaya -
                  watt.beban -
                  ((biaya < 250000)
                      ? 0
                      : biaya >= 1000000
                          ? 6000
                          : 3000)) /
              1.08;
          var batas1 = watt.batasblok1 * watt.blok1;
          var batas2 = watt.batasblok2 * watt.blok2;
          if (pemakaian < batas1) {
            bnykkwh = (pemakaian / watt.blok1).toStringAsFixed(1);
            log("$pemakaian-${watt.blok1}-$bnykkwh-$batas1");
          } else if (pemakaian < (batas2 + batas1)) {
            bnykkwh = (((pemakaian - batas1) / watt.blok2) + watt.batasblok1)
                .toStringAsFixed(1);
            log("2i");
          } else {
            bnykkwh = (((pemakaian - batas1 - batas2) / watt.blok3 +
                    watt.batasblok1 +
                    watt.batasblok2))
                .toStringAsFixed(1);
            log("3i");
          }
          log("pasca sini");
        }
      } else {
        log("nyasar");
      }
    } catch (e) {
      log("errornya disini");
    }
    update();
  }

  void air() {
    try {
      var biaya = int.parse(hargaText.text.replaceAll(",", ""));
      var airTarif = airs.firstWhere((e) => e.judul == tarifair);
      if (tarifair != "" && hargaText.text != "") {
        var pemakaian = (biaya - airTarif.beban);
        var batas1 = airTarif.batasblok1 * airTarif.blok1;
        var batas2 = airTarif.batasblok2 * airTarif.blok2;
        var batas3 = airTarif.batasblok3 * airTarif.blok3;
        if (pemakaian < batas1) {
          bnykmkubik = (pemakaian / airTarif.blok1).toStringAsFixed(1);
          log("$pemakaian-${airTarif.blok1}-$bnykmkubik-$batas1");
        } else if (pemakaian < (batas1 + batas2)) {
          bnykmkubik =
              (((pemakaian - batas1) / airTarif.blok2) + airTarif.batasblok1)
                  .toStringAsFixed(1);
          log("2i");
        } else if (pemakaian < (batas1 + batas2 + batas3)) {
          bnykmkubik = (((pemakaian - batas1 - batas2) / airTarif.blok3 +
                  airTarif.batasblok1 +
                  airTarif.batasblok2))
              .toStringAsFixed(1);
          log("3i");
        } else {
          bnykmkubik =
              ((((pemakaian - batas1 - batas2 - batas3) / airTarif.blok4) +
                      airTarif.batasblok1 +
                      airTarif.batasblok2 +
                      airTarif.batasblok3))
                  .toStringAsFixed(1);
          log("3i");
        }
        log("pasca sini");
      } else {
        log("nyasar");
      }
    } catch (e) {
      log("errornya disini");
    }
    update();
  }

  void clear() {
    banyakText.clear();
    hargaText.clear();
    hargaSubsidiText.clear();
    catatanText.clear();
    statusKonsumsi = "";
    artPilihan = "";
    watts = "";
    layananPln = "";
    bnykkwh = "";
    bnykmkubik = "";
    tarifair = "";
    waktu = WaktuData();
    konversi = Konversi();
    satuanHarga = Konversi();
    banyakNode.requestFocus();
    editDataKonsumsi = Konsumsi();
    indexk = -1;
    update();
  }

  void hapus(Konsumsi x) {
    var indexk = konsumsiTerpilih.indexWhere((element) => element == x);
    konsumsiTerpilih.removeAt(indexk);
    filterkonsumsiTerpilih = konsumsiTerpilih
        .where((e) => e.komoditi == komoditiTerpilih.no)
        .toList();
    box.write("${rutaTerpilih.nks}-${rutaTerpilih.ruta}",
        Konsumsi.toJsonList(konsumsiTerpilih));
    editDataKonsumsi = Konsumsi();
    update();
  }

  void edit(Konsumsi x) {
    editDataKonsumsi = x;
    indexk = konsumsiTerpilih.indexWhere((element) => element == x);

    var z = konsumsiTerpilih[indexk];
    try {
      konversi =
          listKonversi.firstWhere((element) => "${element.nama}" == z.konversi);
    } catch (e) {
      konversi = Konversi();
    }
    try {
      satuanHarga = listKonversi
          .firstWhere((element) => "${element.nama}" == z.satuanHarga);
    } catch (e) {
      satuanHarga = Konversi();
    }

    try {
      if (z.konversi!.contains("-")) {
        var plnsplit = z.konversi!.split("-");
        layananPln = plnsplit[0];
        watts = plnsplit[1];
        bnykkwh = z.banyak!;
        log("disini ada -");
        log("${z.konversi}");
      } else {
        tarifair = z.konversi!;
        log("tidak ada -");
      }
    } catch (e) {
      null;
    }
    log(z.banyak!);
    banyakText = TextEditingController(
        text: (z.banyakKonv != "") ? z.banyakKonv : z.banyak);
    hargaText = TextEditingController(text: z.harga);
    catatanText = TextEditingController(text: z.catatan);
    statusKonsumsi = z.statusKonsumsi!;
    bnykmkubik = z.banyak!;
    artPilihan = z.art ?? "";
    waktu = listWaktu.firstWhere((element) => element.waktu == z.waktu);
    editKonsumsi = true;
    update();
  }

  void kirim() async {
    var ty = Konsumsi.toJsonList(konsumsiTerpilih);
    final gsheets = GSheets(ApiPath.credential);
    final spreadsheets = await gsheets
        .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
    var gsheet = spreadsheets.worksheetByTitle('konsumsi')!;
    var konversi = await gsheet.values.map.allRows() as List<dynamic>;
    var indexGsheets = konversi.indexWhere(
        (e) => e["nks"] == rutaTerpilih.nks && e["ruta"] == rutaTerpilih.ruta);
    var ii = konversi
        .where((e) =>
            e["nks"] == rutaTerpilih.nks && e["ruta"] == rutaTerpilih.ruta)
        .length;
    var ee = konsumsiTerpilih.length;
    var uu = ee - ii;
    log("$indexGsheets - $ii - $ee - $uu");
    if (indexGsheets == -1) {
      gsheet.values.map.appendRows(ty);
      log("pertama");
    } else if (uu < 0) {
      log("kurangi");
      gsheet.deleteRow((indexGsheets + 2), count: uu.abs());
      gsheet.values.map.insertRows((indexGsheets + 2), ty);
    } else if (uu > 0) {
      gsheet.insertRow((indexGsheets + 2), count: uu);
      gsheet.values.map.insertRows(indexGsheets + 2, ty);
      log("tambah");
    } else {
      log("disini dulu ya");
    }
    log("lolos");
  }

  void getPertanyaan() async {
    try {
      final gsheets = GSheets(ApiPath.credential);
      final spreadsheets = await gsheets
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
      datasheets = spreadsheets.worksheetByTitle('pertanyaan')!;
      final biodatas = await datasheets!.values.map.allRows() as List<dynamic>;
      var dataSheet = Pertanyaan.fromJsonList(biodatas);
      daftarPertanyaanRuta =
          dataSheet.where((e) => (e.petugas == "RUTA")).toList();
      box.write(
          "daftarPertanyaanRuta", Pertanyaan.toJsonList(daftarPertanyaanRuta));

      update();
    } catch (e) {
      print('Init Error get Pertanyaan: $e');
    }
  }

//update data
  void onUpdate(String id, bool value) {
    values[id] = value;
    values.update(id, (_) => value);
    log(values.toString());
    update();
  }

  RefreshController refreshController = RefreshController();
}
