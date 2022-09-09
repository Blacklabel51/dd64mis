part of cloud;

class CloudController extends GetxController {
  var dataPetugas = List<Petugas>.empty();
  var unikKab = List<Petugas>.empty();
  var kabTerpilih = "";

  var petugasTerpilih = Petugas();
  var petugasSimpanan = Petugas();
  var petugasSementara = Petugas();

  var dataSampel = List<Sampel>.empty();
  var sampelSimpanan = List<dynamic>.empty();
  var dataSampelan = List<Map<String, dynamic>>.empty();

  var dataPertanyaan = List<Pertanyaan>.empty();
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
  @override
  void onInit() async {
    super.onInit();
    getSampel();
    try {
      petugasTerpilih = Petugas.fromJson(box.read("petugasTerpilih"));
      dataSampel = Sampel.fromJsonList(box.read("sampelTerpilih"));

      daftarPertanyaan = Pertanyaan.fromJsonList(box.read("daftarPertanyaan"));
      update();
    } catch (e) {
      log('Belum ada data $e');
    }
    try {
      var c = box.read("sampelTerpilih") as List;
      dataSampelan = c.map<Map<String, dynamic>>((e) => e).toList();
    } catch (e) {
      dataSampelan = List<Map<String, dynamic>>.empty();
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

  void getPetugas() async {
    try {
      final gsheets = GSheets(ApiPath.credential);
      final spreadsheets = await gsheets
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
      datasheetPetugas = spreadsheets.worksheetByTitle('petugas')!;
      final biodatas =
          await datasheetPetugas!.values.map.allRows() as List<dynamic>;
      var dataSheet = Petugas.fromJsonList(biodatas);
      dataPetugas = dataSheet;
      box.write("dataPetugas", biodatas);
      update();
      log(dataPetugas.length.toString());
    } catch (e) {
      log('Init Error get Petugas: $e');
    }
  }

  void getSampel() async {
    try {
      final gsheets = GSheets(ApiPath.credential);
      final spreadsheets = await gsheets
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
      datasheetSampel = spreadsheets.worksheetByTitle('sampel')!;
      final biodatas = await datasheetSampel.values.map.allRows()
          as List<Map<String, String>>;
      dataSampelan = biodatas
          .where((e) => (petugasTerpilih.status == "PCL")
              ? (e["kodePcl"] == petugasTerpilih.kodePetugas &&
                  e["kabkota"] == petugasTerpilih.kodekabkota)
              : e["kodePml"] == petugasTerpilih.kodePetugas &&
                  e["kabkota"] == petugasTerpilih.kodekabkota)
          .toList();
      dataSampel = Sampel.fromJsonList(dataSampelan);
      update();
      box.write("sampelTerpilih", dataSampelan);
      log("message");
      log(dataSampel
          .map((e) =>
              "${e.nks}-${e.ruta}-${e.namaArt}-${e.namaArt!.length.toString()}")
          .toString());
    } catch (e) {
      log('Init Error get Sampel: $e');
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
    try {
      if (datasheetSampel.rowCount == 0) return false;
      return await datasheetSampel.values.map.insertRowByKey(
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
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
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

  RefreshController refreshController = RefreshController();

  void refreshData() {
    getSampel();
    getPetugas();
    refreshController.refreshCompleted();
  }

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
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
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
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
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
