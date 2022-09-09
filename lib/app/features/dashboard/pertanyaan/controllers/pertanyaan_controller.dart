import 'package:mysusenas/app/constans/app_constants.dart';
import 'package:mysusenas/app/features/dashboard/cloud/views/screens/cloud_screen.dart';
import 'package:mysusenas/app/features/dashboard/pertanyaan/models/data_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gsheets/gsheets.dart';
import 'package:intl/intl.dart';
import 'package:latlong_to_osgrid/latlong_to_osgrid.dart';
import 'package:location/location.dart';

LatLongConverter converter = new LatLongConverter();

class PertanyaanController extends GetxController {
  late Worksheet datasheetSampel;
  late Worksheet dataPertanyaan;
  String nilai = "";
  String nilaihari = "";
  final box = GetStorage();
  var daftarPertanyaan = List<Pertanyaan>.empty();
  final Map<String, dynamic> values = {};
  List<Map<String, dynamic>> listoffline = [];
  int badgesoffline = 0;

  PermissionStatus? _permissionGranted;
  Location location = new Location();
  late bool _serviceEnabled;
  LocationData? _locationData;
  String koordinat = "";
  String koordinatDerajat = "";
  bool isloading = false;
  bool isloadingSave = false;
  var currentTime = DateTime.now();
  DateTime? waktuchange = DateTime.now();
  List<DateTime> waktujam = [];
  List<String> listjam = [];
  final d = Get.put(CloudController());
  var index = -1;
  @override
  void onInit() async {
    super.onInit();
    try {
      daftarPertanyaan = Pertanyaan.fromJsonList(box.read("daftarPertanyaan"));
    } catch (e) {}
  }

  TextEditingController sPencacahan = TextEditingController();
  TextEditingController sDokClean = TextEditingController();
  TextEditingController sPemeriksaan = TextEditingController();
  TextEditingController sOlah = TextEditingController();
  TextEditingController koordinattext = TextEditingController(text: "");

  void updateSampel(String id) async {
    try {
      final _gsheets = GSheets(ApiPath.credential);
      final spreadsheets = await _gsheets
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
      datasheetSampel = spreadsheets.worksheetByTitle('sampel')!;
      // if (datasheetSampel.rowCount == 0) return false;
      print(values);
      await datasheetSampel.values.map
          .insertRowByKey(
            id,
            values,
          )
          .then((_) => d.getSampel());
    } catch (e) {
      // print("cek");
      try {
        var c = box.read("listoffline") as List;
        listoffline = c.map<Map<String, dynamic>>((e) => e).toList();
        index = listoffline.indexWhere((z) => z['id'] == id);
        update();
      } catch (e) {}
      print(index);
      print(listoffline);

      values['id'] = id;
      values.update("id", (_) => id);
      (index < 0) ? listoffline.add(values) : listoffline[index] = values;

      // box.remove("listoffline");
      // listoffline = [];
      update();
      box.write("listoffline", listoffline);
      d.updatebadges(listoffline.length);
      print(listoffline);
    }
  }

  void updateOffline() async {
    try {
      final _gsheets = GSheets(ApiPath.credential);
      final spreadsheets = await _gsheets
          .spreadsheet("1_7wRmyZPPuvf1FSTcFq4npu8U1GKByeuK2Sq8ieVY4c");
      datasheetSampel = spreadsheets.worksheetByTitle('sampel')!;

      if (listoffline.length == 0) {
        print("kosong");
      } else {
        print(listoffline);
        for (int i = 0; i < listoffline.length; i++) {
          await datasheetSampel.values.map.insertRowByKey(
            listoffline[i]["id"],
            listoffline[i],
          );
          print(listoffline[i]["id"]);
        }
        print("objectku");
      }
    } catch (e) {
      print(e);
    }
  }

//update data
  void onUpdate(String id, String value) {
    values[id] = value;
    print("lalalalaa");
    print(values);
    values.update(id, (_) => value);
    print(values);
    update();
    print(values);
  }

//update pilihan banyak
  void nilailah(String id, String nil) {
    nilai = nil;
    update([id]);
  }

//koordinat
  Future<void> locationPermission(String id) async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    isloading = true;
    update();
    try {
      _locationData = await location.getLocation().then((value) {
        try {
          // final LocationData _locationData = await location.getLocation();
          print("llllooooo");
          // _locationData = await location.getLocation();
          koordinat = "${value.latitude}, ${value.longitude}";
          print(koordinat);
          var latDms = converter.getDegreeFromDecimal(value.latitude!);
          var longDms = converter.getDegreeFromDecimal(value.longitude!);
          koordinatDerajat =
              "${latDms[0]}° ${latDms[1]}' ${latDms[2].toStringAsFixed(2)}\", ${longDms[0]}° ${longDms[1]}' ${longDms[2].toStringAsFixed(2)}\"";
          isloading = false;
          print("ooooo");
          update();
          onUpdate(id, koordinat);
        } catch (err) {
          print(err);
        }
        return value;
      });
    } catch (err) {
      print(err);
    }
  }

  void ambilpermisi() async {
    _locationData = await location.getLocation();
  }

  //
  //ambil jawaban
  ambilderajat(String jawaban) {
    try {
      var cek = jawaban.split(",");
      var latDms = converter.getDegreeFromDecimal(double.parse(cek[0]));
      var longDms = converter.getDegreeFromDecimal(double.parse(cek[1]));
      koordinatDerajat =
          "${latDms[0]}° ${latDms[1]}' ${latDms[2].toStringAsFixed(2)}\", ${longDms[0]}° ${longDms[1]}' ${longDms[2].toStringAsFixed(2)}\"";
    } catch (e) {
      print("tak ada data koordinat");
      koordinatDerajat = "";
    }
    update();
  }

  //tambahjam
  tambahjam(DateTime val) {
    try {
      listjam.add(DateFormat('dd-MM-yyyy HH:mm').format(val));
      print(val);
    } catch (e) {
      print("ceko");
      print(DateTime.now());
      listjam.add(DateFormat('dd-MM-yyyy HH:mm').format(currentTime));
    }

    update();
  }

//tambahjam
  ubahjam(DateTime val) {
    waktuchange = val;
    update();
  }

  //tambahjam
  hapusjam(int index) {
    listjam.removeAt(index);
    update();
  }

  //ambillistjam
  ambiljam(String ambillistjam) {
    (ambillistjam == "") ? listjam = [] : listjam = ambillistjam.split(",");
    update();
  }

  //update pilihan fenomena
  void initpilihan(String id, String nil) {
    nilai = nil;
    update([id]);
  }

  //tambahjam
  tambahhari(String id, DateTime hari) {
    nilaihari = DateFormat('dd-MM-yyyy').format(hari);
    update([id]);
  }

  //tambahjam
  ambilhari(String id, String hari) {
    nilaihari = hari;
    update([id]);
  }
}
