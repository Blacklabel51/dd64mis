part of cloud;

class CloudController extends GetxController {
  var dataPetugas = List<Petugas>.empty();
  var unikKab = List<Petugas>.empty();
  var kabTerpilih = "";

  var petugasTerpilih = Petugas();
  var petugasSimpanan = Petugas();
  var petugasSementara = Petugas();

  var dataSampel = List<Sampel>.empty();
  var dataUpdating = List<Updating>.empty();
  var sampelSimpanan = List<dynamic>.empty();
  var dataSampelan = List<Map<String, dynamic>>.empty();
  var dataUpdatingan = List<Map<String, dynamic>>.empty();

  var dataPertanyaan = List<Pertanyaan>.empty();
  var dataGk = Gk();
  var daftarPertanyaan = List<Pertanyaan>.empty();
  var daftarPertanyaanRuta = List<Pertanyaan>.empty();

  var dataFenomena = List<Fenomena>.empty();
  late Worksheet? datasheetsFenomena;

  final box = GetStorage();
  late Worksheet worksheetSampel;
  late Worksheet datasheetSampel;
  Worksheet? datasheetPetugas;
  Worksheet? datasheetPertanyaan;
  String nilai = "";

  Map<String, dynamic> values = {};

  int badgesoffline = 0;

  var pesanerror = '';
  @override
  void onInit() async {
    super.onInit();
    getSampel();
    getUpdating();
    try {
      petugasTerpilih = Petugas.fromJson(box.read("petugasTerpilih"));
      dataSampel = Sampel.fromJsonList(box.read("sampelTerpilih"));
      dataUpdating = Updating.fromJsonList(box.read("updatingsTerpilih"));

      daftarPertanyaan = Pertanyaan.fromJsonList(box.read("daftarPertanyaan"));
      update();
      log("disini petugas terpilih");
    } catch (e) {
      log('Belum ada data petugas terpilih $e');
    }
    try {
      var c = box.read("sampelTerpilih") as List;
      dataSampelan = c.map<Map<String, dynamic>>((e) => e).toList();
    } catch (e) {
      dataSampelan = List<Map<String, dynamic>>.empty();
    }
    try {
      dataGk = Gk.fromJson(box.read("gk2022"));
    } catch (e) {
      log('Belum ada data garis kemiskinan$e');
    }
    try {
      var c = box.read("updatingTerpilih") as List;
      dataUpdatingan = c.map<Map<String, dynamic>>((e) => e).toList();
    } catch (e) {
      dataUpdatingan = List<Map<String, dynamic>>.empty();
    }
    try {
      dataFenomena = Fenomena.fromJsonList(box.read("fenomenaTerpilih"));
      update();
    } catch (e) {
      getFenomena();
    }
    try {
      dataPetugas = Petugas.fromJsonList(box.read("dataPetugas"));
      update();
      log("petugas disini");
    } catch (e) {
      getPetugas();
      log("dapat petugas $e");
    }
  }

  Future<bool> getPetugas() async {
    try {
      final gsheets = GSheets(ApiPath.credentialAlternatif);
      final spreadsheets = await gsheets
          .spreadsheet("1SeIW94K87vBQazxMHhwAUCf7ihyg7m9MKj5JX4dpHlk");
      datasheetPetugas = spreadsheets.worksheetByTitle('petugas')!;
      final biodatas =
          await datasheetPetugas!.values.map.allRows() as List<dynamic>;
      var dataSheet = Petugas.fromJsonList(biodatas);
      dataPetugas = dataSheet;
      box.write("dataPetugas", biodatas);
      update();
      log(dataPetugas.length.toString());
      return true;
    } catch (e) {
      log('Init Error get Petugas: $e');
      return false;
    }
  }

  Future<bool> getSampel() async {
    try {
      final gsheets = GSheets(ApiPath.credentialAlternatif);
      final spreadsheets = await gsheets
          .spreadsheet("1SeIW94K87vBQazxMHhwAUCf7ihyg7m9MKj5JX4dpHlk");
      datasheetSampel = spreadsheets.worksheetByTitle('sampel')!;
      final biodatas = await datasheetSampel.values.map.allRows()
          as List<Map<String, String>>;
      dataSampelan = biodatas
          .where((e) => (petugasTerpilih.status == "PCL")
              ? (e["kodePcl"] == petugasTerpilih.kodePetugas &&
                  e["kabkota"] == petugasTerpilih.kodekabkota)
              : (petugasTerpilih.status == "PML")
                  ? (e["kodePml"] == petugasTerpilih.kodePetugas &&
                      e["kabkota"] == petugasTerpilih.kodekabkota)
                  : e["kabkota"] == petugasTerpilih.kodekabkota)
          .toList();
      dataSampel = Sampel.fromJsonList(dataSampelan);
      update();
      box.write("sampelTerpilih", dataSampelan);
      log("sampelTerpilih ada kok");
      return true;
    } catch (e) {
      log('Init Error get Sampel: $e');
      pesanerror = e.toString();
      return false;
    }
  }

  Future<bool> getUpdating() async {
    try {
      final gsheets = GSheets(ApiPath.credentialAlternatif);
      final spreadsheets = await gsheets
          .spreadsheet("1SeIW94K87vBQazxMHhwAUCf7ihyg7m9MKj5JX4dpHlk");
      var datasheetSampel = spreadsheets.worksheetByTitle('updating')!;
      final biodatas = await datasheetSampel.values.map.allRows()
          as List<Map<String, String>>;
      dataUpdatingan = biodatas
          .where((e) => (petugasTerpilih.status == "PCL")
              ? (e["kodePcl"] == petugasTerpilih.kodePetugas &&
                  e["kabkota"] == petugasTerpilih.kodekabkota)
              : (petugasTerpilih.status == "PML")
                  ? (e["kodePml"] == petugasTerpilih.kodePetugas &&
                      e["kabkota"] == petugasTerpilih.kodekabkota)
                  : e["kabkota"] == petugasTerpilih.kodekabkota)
          .toList();
      dataUpdating = Updating.fromJsonList(dataUpdatingan);
      update();
      box.write("updatingTerpilih", dataUpdatingan);
      return true;
    } catch (e) {
      log('Init Error get Updating: $e');
      return false;
    }
  }

  void pilihKab(String data) {
    kabTerpilih = data;
    update();
  }

  void sementaraPetugas(Petugas data) {
    petugasSementara = data;
    update();
  }

  void pilihPetugas(Petugas data) {
    petugasTerpilih = data;
    box.write("petugasTerpilih", data.toJson());
    update();
  }

  Future<bool> updateSampel(String id, Map<String, dynamic> kirim) async {
    final gcsheets = GSheets(ApiPath.credentialSuper);
    final spreadsheets = await gcsheets
        .spreadsheet("1SeIW94K87vBQazxMHhwAUCf7ihyg7m9MKj5JX4dpHlk");
    log("input data");
    var data = spreadsheets.worksheetByTitle('sampel')!;
    try {
      if (data.rowCount == 0) return false;
      return await data.values.map.insertRowByKey(
        id,
        kirim,
      );
    } catch (e) {
      return false;
    }
  }

  Future<bool> updatePemutakhiran(String id, Map<String, dynamic> kirim) async {
    final gsheets = GSheets(ApiPath.credentialAlternatif);
    final spreadsheets = await gsheets
        .spreadsheet("1SeIW94K87vBQazxMHhwAUCf7ihyg7m9MKj5JX4dpHlk");
    var datasheetUpdating = spreadsheets.worksheetByTitle('updating')!;
    try {
      if (datasheetUpdating.rowCount == 0) return false;
      return await datasheetUpdating.values.map.insertRowByKey(
        id,
        kirim,
      );
    } catch (e) {
      return false;
    }
  }

  void getPertanyaan() async {
    try {
      final gsheets = GSheets(ApiPath.credential);
      final spreadsheets = await gsheets
          .spreadsheet("1SeIW94K87vBQazxMHhwAUCf7ihyg7m9MKj5JX4dpHlk");
      datasheetPertanyaan = spreadsheets.worksheetByTitle('pertanyaan')!;
      final biodatas =
          await datasheetPertanyaan!.values.map.allRows() as List<dynamic>;
      var dataSheet = Pertanyaan.fromJsonList(biodatas);
      dataPertanyaan = dataSheet
          .where((e) => (e.petugas == petugasTerpilih.status))
          .toList();
      daftarPertanyaanRuta =
          dataSheet.where((e) => (e.petugas == "RUTA")).toList();
      box.write("daftarPertanyaan", Pertanyaan.toJsonList(dataPertanyaan));
      box.write(
          "daftarPertanyaanRuta", Pertanyaan.toJsonList(daftarPertanyaanRuta));
      update();
    } catch (e) {
      log('Init Error get Pertanyaan: $e');
    }
  }

  Future<bool> getGk() async {
    try {
      final gsheets = GSheets(ApiPath.credentialAlternatif);
      final spreadsheets = await gsheets
          .spreadsheet("1SeIW94K87vBQazxMHhwAUCf7ihyg7m9MKj5JX4dpHlk");
      datasheetPertanyaan = spreadsheets.worksheetByTitle('garis kemiskinan')!;
      final biodatas =
          await datasheetPertanyaan!.values.map.allRows() as List<dynamic>;
      var dataSheet = Gk.fromJsonList(biodatas);
      dataGk =
          dataSheet.firstWhere((e) => (e.kode == petugasTerpilih.kodekabkota));
      box.write("gk2022", dataGk.toJson());
      update();
      log('Garis Kemiskinan nih bos: ${dataGk.kabkota}-${dataGk.gk2022}');
      return true;
    } catch (e) {
      log('Init Error get Garis Kemiskinan: $e');
      return false;
    }
  }

  RefreshController refreshController = RefreshController();

  void refreshData() {
    Future(() async {
      var a = await getSampel();
      var b = await getPetugas();
      var c = await getGk();
      // var d = await getUpdating();
      if (a || b || c) {
        return true;
      } else {
        return false;
      }
    }).then((value) {
      if (value) {
        refreshController.refreshCompleted();
        Get.showSnackbar(const GetSnackBar(
            message: "Berhasil",
            backgroundColor: Colors.greenAccent,
            duration: Duration(seconds: 3)));
      } else {
        refreshController.refreshFailed();
        Get.showSnackbar(GetSnackBar(
            message: pesanerror,
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 3)));
      }
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      refreshController.refreshToIdle();
      Get.showSnackbar(const GetSnackBar(
          message: "Refresh ulang ki",
          backgroundColor: Colors.grey,
          duration: Duration(seconds: 3)));
    });
  }

  // {
  //   getSampel();
  //   getPetugas();
  //   getGk();
  //   refreshController.refreshCompleted();
  // }

  TextEditingController sPencacahan = TextEditingController();
  TextEditingController sDokClean = TextEditingController();
  TextEditingController sPemeriksaan = TextEditingController();
  TextEditingController sOlah = TextEditingController();

  //update pilihan banyak
  void nilailah(String nil) {
    nilai = nil;
    update();
  }

  //update data
  void onUpdate(String id, String value) {
    values[id] = value;
    values.update(id, (_) => value);
    update();
    // log(_values);
  }

  //update data
  void updatebadges(int id) {
    badgesoffline = id;
    update();
    // log(_values);
  }

  void updateOffline() async {
    try {
      final gsheets = GSheets(ApiPath.credential);
      final spreadsheets = await gsheets
          .spreadsheet("1SeIW94K87vBQazxMHhwAUCf7ihyg7m9MKj5JX4dpHlk");
      datasheetSampel = spreadsheets.worksheetByTitle('sampel')!;
      var c = box.read("listoffline") as List;
      var dataoffline = c.map<Map<String, dynamic>>((e) => e).toList();

      if (dataoffline.isEmpty) {
        log("kosong");
      } else {
        Future.wait(
            dataoffline.map((e) => datasheetSampel.values.map.insertRowByKey(
                  e["id"],
                  e,
                ))).then((value) {
          box.remove("listoffline");
          updatebadges(0);
          log("okay");
        });
      }
    } catch (e) {}
  }

  RefreshController refreshControllerFenomena = RefreshController();
  void refreshDatafenomena() {
    getFenomena();
    refreshControllerFenomena.refreshCompleted();
  }

  void getFenomena() async {
    try {
      final gsheets = GSheets(ApiPath.credential);
      final spreadsheets = await gsheets
          .spreadsheet("1SeIW94K87vBQazxMHhwAUCf7ihyg7m9MKj5JX4dpHlk");
      datasheetsFenomena = spreadsheets.worksheetByTitle('fenomena');
      final biodatas =
          await datasheetsFenomena!.values.map.allRows() as List<dynamic>;
      dataFenomena = Fenomena.fromJsonList(biodatas);
      box.write("fenomenaTerpilih", dataFenomena);
      update();
    } catch (e) {
      log('Init Error opopopo: $e');
    }
  }

  void updateFenomena(String id) async {
    values["petugas"] = "";
    values["waktu"] = "";
    values.update("petugas", (_) => petugasTerpilih.nama);
    values.update("waktu", (_) => DateFormat.yMEd('id').format(DateTime.now()));
    try {
      if (id == "") {
        var uuid = const Uuid();

        await datasheetsFenomena!.values.map.insertRowByKey(uuid.v4(), values);
      } else {
        await datasheetsFenomena!.values.map.insertRowByKey(id, values);
      }
    } catch (e) {
      log("$e");
    }
    reset();
    Future.delayed(const Duration(seconds: 1), () {
      getFenomena();
    });
  }

  //reset
  void reset() {
    nilai = "";
    values = {};
    update();
  }

  //update pilihan fenomena
  void nilaifenomena(String id, String nil) {
    nilai = nil;
    update([id]);
    values[id] = nil;
    values.update(id, (_) => nil);
    update();
  }

  //update pilihan fenomena
  void initfenomena(String id, String nil) {
    nilai = nil;
    update([id]);
  }

  //delete pilihan fenomena
  void deletefenomena(String id) async {
    try {
      await datasheetsFenomena!.values.map.insertRowByKey(id, {'delete': '1'});
    } catch (e) {
      log("$e");
    }
  }
}
