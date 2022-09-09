import 'package:get/get.dart';

import '../models/data_model.dart';

class DataProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Pertanyaan.fromJson(map);
      if (map is List)
        return map.map((item) => Pertanyaan.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Pertanyaan?> getData(int id) async {
    final response = await get('data/$id');
    return response.body;
  }

  Future<Response<Pertanyaan>> postData(Pertanyaan data) async =>
      await post('data', data);
  Future<Response> deleteData(int id) async => await delete('data/$id');
}
