part of kode;
// final Worksheet? datasheets;

class KodeController extends GetxController {
  var listKode = List<Kode>.empty();
  var filterlistKode = List<Kode>.empty();
  late Spreadsheet? spreadsheets;
  late Worksheet? datasheets;
  var loading = true;
  var petugasTerpilih = Petugas();
  final box = GetStorage();
  TextEditingController textController = TextEditingController();
  // Spreadsheet? spreadsheets;
  bool isLoading = false;

  @override
  void onInit() async {
    textController = TextEditingController();
    try {
      spreadsheets = await GSheets(ApiPath.credential)
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
      datasheets = spreadsheets!.worksheetByTitle('kode');
      update();
    } catch (e) {
      print("tidak ada data");
    }
    super.onInit();
    try {
      listKode = Kode.fromJsonList(box.read("kode"));
      filterlistKode = listKode;
      update();
    } catch (e) {
      getData();
    }
    try {
      petugasTerpilih = Petugas.fromJson(box.read("petugasTerpilih"));
      update();
    } catch (e) {
      print('Belum ada data $e');
    }
  }

  @override
  void dispose() {
    print('dispose');
    // _streamController.close();
    super.dispose();
  }

  void getData() async {
    try {
      final kode = await datasheets!.values.map.allRows() as List<dynamic>;
      listKode = Kode.fromJsonList(kode);
      filterlistKode = listKode;
      box.write("kode", kode);
      update();
    } catch (e) {
      print('Init Error: $e');
    }
  }

  RefreshController refreshController = RefreshController();

  void refreshData() {
    getData();
    refreshController.refreshCompleted();
  }

  void search(String kodeCari) {
    if (kodeCari.isNotEmpty) {
      filterlistKode = listKode
          .where((data) =>
              ((data.pekerjaan != null)
                  ? data.pekerjaan!.toLowerCase().contains(kodeCari)
                  : false) ||
              ((data.kbli != null)
                  ? data.kbli!.toLowerCase().contains(kodeCari)
                  : false) ||
              ((data.kbji != null)
                  ? data.kbji!.toLowerCase().contains(kodeCari)
                  : false) ||
              ((data.contoh != null)
                  ? data.contoh!.toLowerCase().contains(kodeCari)
                  : false) ||
              ((data.catatan != null)
                  ? data.catatan!.toLowerCase().contains(kodeCari)
                  : false) ||
              ((data.pertanyaan != null)
                  ? data.pertanyaan!.toLowerCase().contains(kodeCari)
                  : false) ||
              ((data.tanggapan != null)
                  ? data.tanggapan!.toLowerCase().contains(kodeCari)
                  : false) ||
              ((data.user != null)
                  ? data.catatan!.toLowerCase().contains(kodeCari)
                  : false))
          .toList();
      update();
    } else {
      filterlistKode = listKode;
      update();
    }
  }

  void clear() {
    textController.clear();
  }

  void tanya(String tanya) async {
    isLoading = true;
    update();
    var uuid = const Uuid();
    try {
      await datasheets!.values.map.insertRowByKey(uuid.v4(), {
        "pertanyaan": tanya,
        "status": "tanya",
        "user":
            (petugasTerpilih.nama == null) ? "No name" : petugasTerpilih.nama
      });
    } catch (e) {
      print('Init Error: $e');
    }
    isLoading = false;
    update();
    Get.back();
    getData();
  }
}
