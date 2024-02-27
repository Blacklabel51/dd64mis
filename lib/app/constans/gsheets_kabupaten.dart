part of app_constants;
// import 'package:gsheets/gsheets.dart';
// import 'package:idcard7325/model/gsheets_data.dart';
// import 'package:get/get.dart';

class GKabupaten extends GetConnect {
  static const _credential = r'''
  {
  "type": "service_account",
  "project_id": "kodsa-318314",
  "private_key_id": "9379ba3f0bdc4eb3cd8e8b6677c90589d980226c",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCfNvu2S43G5RfR\naxerMsDq96Aj5jsUaZES8e/EL0cNhBNTJhXUBiqXn1ja0K0sIhw2vFG3saNRUFxd\nyAmlaqhUQ2NHbCBGiMjH6umI94fUSh7Z8HSOTbE+w/m/9zW/oAe0koH1ZliCG8Vn\nWXCEPT4134JmJjJCJaePCoEwO5eVbY/UtYuydYoVuYpF8nw6C1QsrJ395fAyBmLO\nG8mhNBhqgKuDYTHne/s8mV7Afr+j38WmJ/Lraag6eObpGOBLvJeGosYePnUiENbR\nYuQCTa6LP0R+a6CMs0q8t3hjULRtXYOwvwoh4XQikPlQC/bKG45cMgSpUh5lFn1E\nu+9F/C3dAgMBAAECggEAHzj1G8atQvfiN9s8hQIq+ukcqm2X4GTjYke3sU1kLa5c\n681oMnATIjDJh/+sNh9qUQGVNOTNFkEgG/QCkEHeSMf+TB9UJQDl/u5+ZbHFHUh7\nzFlvQgjSXXCpJZAhJjcHy81/VtR/PuSbTa0od4ZbEM2IEOgkqvwfY9m3g/HrxA2t\nGUgMa2fkrhu7aWNTQ+pMCxKUpc4nz+LjiF+Aa1AuFsQv3rpEbcyIQ8B2cP0FW6Xb\nw1/xR1U3vbgrXd0En879ZbeixEoiSfp1564PXmPq0cD3zILaCnJ/tNAWo+BTocda\n1rY3mtKn0YU+DTyMtfPT5k8y/gAzozBtbQ3iyYR3AQKBgQDNWe7JoSzjMDBMY1n1\n9C2OBReUovWgxBOrb9GRbptIqVLHWFfUXMykfxqqFWbjI23Ih5jv9fzc1dBi3Keh\npiM9HIsTQdDQiWr+8N1DX97iKUWqtZAfIa40Ffr+rGO+fnKszwVifkQ0TchKz3un\nnCITPfXtbGc2QXkBmk2dFix2DQKBgQDGe/LdaEi62wK3xIDY/feXCePr8m1er8lg\nN5YioQQv8eVVVIFf7kLbtt4I23eqSta2GmvcfU2UcA3DRWc8Ud3uMyzNoj8j6rMS\nZYCgd1eWpcimBnlfh5zonLN7oKMH5e8hLbcjg9upt65RO0XuuK4mYS5H5XL2GDhc\nj/37CGLzEQKBgFz8WDBdF2JYs8YjRt0kkGw6yg64K9l8cBu1KoRcPVyNr7osurii\nvNfP5lcWEdzQcinXnN0r2jB1cUMS/6UnAdXuUtuJdfC4CQcgMlEL3HU0kyNVy8kN\nC0DyoxEnJpNf1rWBmMKcwm2cuxGFGk0vWg60g+ParnHW++BJ6tMy8zcRAoGAShRA\n1LnzSyoqnYPNwy8mlUyvsIROpaReOHcGpe4KrgpOWcascq1ubqqVvCCNTRWZhWXf\nE/AAYIJh4JuqqCy19A1Nj4IapsEWDKutkjZ4jlVZyf1ol2r5+SdjJaUStAPxeCSj\n0bGI7pMLkG3a7/olpVVn/JV6jrcDciib1nGO3MECgYEAu7hCD/WdC2YoAbCnhH72\npmmQifzhYCGMC7nN6VLesI6jzSW5KrvoaEnvHf3AQU1AMxRfNmk1toy8RgZWqsWF\nChWakcSRk9sTafS10SD0iznsupOGb/j9THaQ/m0TUIvARGjujWRRF7bPj3YCWSgF\nnjn72J3Mvh/UnZSoPDmQK5E=\n-----END PRIVATE KEY-----\n",
  "client_email": "kodsa-1@kodsa-318314.iam.gserviceaccount.com",
  "client_id": "100244049584508245094",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/kodsa-1%40kodsa-318314.iam.gserviceaccount.com"
}
  ''';

  static const _idSheet = '1SeIW94K87vBQazxMHhwAUCf7ihyg7m9MKj5JX4dpHlk';
  static final _gsheets = GSheets(_credential);
  static Worksheet? datasheets;

  static Future init() async {
    try {
      final spreadsheets = await _gsheets.spreadsheet(_idSheet);
      // _datasheets = await _getWorkSheet(spreadsheets, title: 'idcard');
      datasheets = spreadsheets.worksheetByTitle('kabupaten');
      // final firstrow = Datasheets.getFields();

      // _datasheets.values.insertRow(1, firstrow);
      // print(_datasheets);
      // print("wq");
    } catch (e) {
      print('Init Error: $e');
    }
  }

  // static Future<Worksheet> _getWorkSheet(
  //   Spreadsheet spreadsheet, {
  //   String? title,
  // }) async {
  //   // try {
  //   //   return await spreadsheet.addWorksheet(title);
  //   // } catch (e) {
  //   //   return spreadsheet.worksheetByTitle(title);
  //   // }
  //   return spreadsheet.worksheetByTitle(title);
  // }

  // static Future insert(List<Map<String, dynamic>> rowList) async {
  //   if (_datasheets == null) return;
  //   _datasheets.values.map.appendRows(rowList);
  // }

  // static Future<bool> insertCNTH(int id, Map<String, dynamic> user) async {
  //   if (_datasheets == null) return false;
  //   return _datasheets.values.map.insertRowByKey(id, user);
  // }

  // static Future<Biodata> getById(String id) async {
  //   if (_datasheets == null) return null;

  //   final json = await _datasheets.values.map.rowByKey(id, fromColumn: 1);

  //   return Biodata.fromJson(json);
  // }

  // static Future<List<Biodata>> getAll() async {
  //   if (_datasheets == null) return <Biodata>[];
  //   // print(await _datasheets.values.lastRow());
  //   final biodatas = await _datasheets.values.map.allRows();
  //   print(biodatas);
  //   print("wkwkwkwkwk");
  //   return biodatas == null
  //       ? <Biodata>[]
  //       : biodatas.map(Biodata.fromJson).toList();
  // }
}
