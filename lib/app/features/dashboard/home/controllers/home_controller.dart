part of home;
// final Worksheet? datasheets;

class HomeController extends GetxController {
  var dataKab = List<Kabupaten>.empty();
  var kabupatenSementara = '';
  var pesanerror = '';
  var listKab = List<String>.empty();
  var dataJadwal = List<Jadwal>.empty();
  late Worksheet? datasheetsJadwal;
  var loading = true;
  final box = GetStorage();
  bool ganti = true;

  @override
  void onInit() {
    super.onInit();
    initializeDateFormatting();
    // getData();
    try {
      dataJadwal = Jadwal.fromJsonList(box.read("jadwalTerpilih"));
      update();
    } catch (e) {
      getJadwal();
    }
    try {
      dataKab = Kabupaten.fromJsonList(box.read("grafik"));
      update();
    } catch (e) {
      getData();
    }
  }

  Future<bool> getJadwal() async {
    try {
      final gsheets = GSheets(ApiPath.credentialAlternatif);
      final spreadsheets = await gsheets
          .spreadsheet("1SeIW94K87vBQazxMHhwAUCf7ihyg7m9MKj5JX4dpHlk");
      datasheetsJadwal = spreadsheets.worksheetByTitle('jadwal');
      final biodatas =
          await datasheetsJadwal!.values.map.allRows() as List<dynamic>;
      dataJadwal = Jadwal.fromJsonList(biodatas);
      box.write("jadwalTerpilih", biodatas);
      loading = false;
      log(dataJadwal[1].tanggal.toString());
      update();
      return true;
    } catch (e) {
      log('Init Error yayaya: $e');
      return false;
    }
  }

  Future<bool> getData() async {
    var cekAsli = await getDataTemp(ApiPath.credential);
    log("cek tahap kedua");
    if (!cekAsli) {
      var cekAlternatif = await getDataTemp(ApiPath.credentialAlternatif);
      log("cek tahap pertama");
      if (cekAlternatif) {
        log("cek salah");
        return true;
      } else {
        log("log salah salah");
        return false;
      }
    } else {
      return true;
    }
  }

  Future<bool> getDataTemp(String credential) async {
    try {
      final gsheets = GSheets(credential);
      final spreadsheets = await gsheets
          .spreadsheet("1SeIW94K87vBQazxMHhwAUCf7ihyg7m9MKj5JX4dpHlk");

      final datasheets = spreadsheets.worksheetByTitle('kabupaten');
      final biodatas = await datasheets!.values.map.allRows() as List<dynamic>;
      try {
        var cek = Petugas.fromJsonList(box.read("dataPetugas"));
        log("data sudah ada ${cek.length}");
      } catch (e) {
        log("error ini dataPetugas $e");
      }
      log("ini cek $kabupatenSementara");
      var dataSheet = Kabupaten.fromJsonList(biodatas);
      box.write("grafik", biodatas);
      dataKab = dataSheet;
      loading = false;
      update();
      return true;
    } catch (e) {
      pesanerror = e.toString();
      log('Init Error: $e');
      return false;
    }
  }

  void ambilkabupaten(String data) {
    kabupatenSementara = data;
    update();
    log("cek ambil kabupaten");
  }

  RefreshController refreshController = RefreshController();
}
