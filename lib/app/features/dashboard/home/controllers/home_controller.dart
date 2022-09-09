part of home;
// final Worksheet? datasheets;

class HomeController extends GetxController {
  var dataKab = List<Kabupaten>.empty();
  var listKab = List<String>.empty();
  var dataJadwal = List<Jadwal>.empty();
  late Worksheet? datasheetsJadwal;
  var loading = true;
  final box = GetStorage();
  // Spreadsheet? spreadsheets;

  @override
  void onInit() {
    super.onInit();
    initializeDateFormatting();
    getData();
    try {
      dataJadwal = Jadwal.fromJsonList(box.read("jadwalTerpilih"));
      update();
    } catch (e) {
      getJadwal();
    }
  }

  void getJadwal() async {
    try {
      final _gsheets = GSheets(ApiPath.credential);
      final spreadsheets = await _gsheets
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
      datasheetsJadwal = spreadsheets.worksheetByTitle('jadwal');
      final biodatas =
          await datasheetsJadwal!.values.map.allRows() as List<dynamic>;
      dataJadwal = Jadwal.fromJsonList(biodatas);
      box.write("jadwalTerpilih", biodatas);
      loading = false;
      print(dataJadwal[1].tanggal);
      update();
    } catch (e) {
      print('Init Error yayaya: $e');
    }
  }

  void getData() async {
    try {
      final _gsheets = GSheets(ApiPath.credential);
      final spreadsheets = await _gsheets
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");

      final datasheets = spreadsheets.worksheetByTitle('kabupaten');
      final biodatas = await datasheets!.values.map.allRows() as List<dynamic>;
      var dataSheet = Kabupaten.fromJsonList(biodatas);
      dataKab = dataSheet;
      print('yeyeye');
      loading = false;
      // dataKab.refresh();
      update();
    } catch (e) {
      print('Init Error: $e');
    }
  }

  void ambilkabupaten() {}

  RefreshController refreshController = RefreshController();

  void refreshData() {
    getData();
    getJadwal();
    refreshController.refreshCompleted();
  }
}
