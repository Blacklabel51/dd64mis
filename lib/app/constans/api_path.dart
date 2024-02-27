part of app_constants;

/// all endpoint api
class ApiPath {
  // Example :
  // static const BASE_URL = "https://api.nitrogia.com";
  // static const product = "$_BASE_URL/product";

  static const credential = r'''
  {
  
  "type": "service_account",
  "project_id": "bps7325",
  "private_key_id": "7282449e8cd40b0a81a84ecec3c43f9db1c4e594",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDNC55Kj4eDRk8r\nJRsYCZpa6rohKKKVROdS59kUMrNRbrpSCe/0K/Kvas6qdxsquT0CK3a/S5Ce+qk/\nVi8A5y41cnoFffS90FhQ5jL7Faqx03bzw0jjHolpDqJ8axHt8VhJB2wsPIiN/Z/e\nkmHaAjXOVvB+v7vMap+8iCg5wQsKqppPTr4rc+E8vJWTm0+hiy1cpSaYuae/o1sT\nqVWEl2CC1E0whn5/jMpcP3zi610gz+Xo+xpAbsafC+vPEpIvwmge2yU4e4NkN4FE\ncbFN9tNTjOYAQu2ZOJJFf/d6zAOk5vKm4mgTwdVEN3dhWMz8NvNhFTTvbMcpkyxF\nqVApTgwzAgMBAAECggEACqDQiqLX7lkFn4Hj3qIYyx+hmDhn/P6+UtDLsr1SCCWK\nKNh1BJ4GjUsm/TUBRnyliehA1nePPn5VqX/JHe3duk19v60gs3oKKd9UwykDWQZS\nAx6bN5KMotJsX7CZFFFPNzHYTI6ysVF1KO9DfS5iJZjiDF/Z1yWrs/UGyL+V1+6a\nIpAgH7lxsUT9BAcyBD6qt1w+ZqKzeG/9DLprZBIfcLuyRiix7g9ctVAw1cgtywGC\nRodWkO1QtuxXfAfuvj6bC0hyy4aTx4CbOliqxcfp9utV+W9hE9byg3as7VNzZn3V\nevpl47WRFWXrc1SUF3H689REQ868DLuhZtSlU4AlcQKBgQDmQf+gO86IjP8/F8SU\nc40pr2dqQZEeZErK3L4RD2L1MZWc0fzN5iNDex7BIH+z6LVAI3S/Xgqtfg+7F1iv\nQFzt0N62RuOD2gDomYpj91HYbyCVkql3zF2wOSC36M44mqNDGNlVxAmC1iI20VHQ\nfh/rT224ZqaXLj+DaGSEeF4ReQKBgQDj+AmoddIA/QIe3cqri/2j93lwdh+2HE9V\nJzVpzLwuNfQ7a6cmLibs8S/x8h9tmFEcsBN/kKI46b3WGyuysOVrFxYgHlRzvW3u\nbnjjzMIWozaqWcDCgDYeOwGLrzPsM/8cFpkYe57w6oDNnmtCbOb/MNZHP6ymo7Td\nWx4MajasCwKBgQCGFPqZQRpks85S3DFRzPPvyT9sRaAO1ZIkDWT0pEQYyfX4auNO\ntuvj+McQ6S7UAffB0KPEaCvJmXXpmY/ABbfXmGCIPkFwXztWN0q6KaPUZ+nOj6f1\npeEMpEekMIIdvhbCFK9CXTS4pp8n0r5UrY1Cxm77CXOK55h+mgSmiz0j6QKBgQDd\nVPujiEjNVtgROctFBNTMtkA8lSMyv4eyqC+uue1WfGHUsy+E3ThDweOH50jmMgVG\nchlsN/OYiDAcySKDCkaj07VSl7/s41TxMmbC3RDvw6UWfa+t56cjcKyOfxtNUCp2\njeY0JAnr4/IMMKv4wR0BVNwmLsckvzqh0454BUNxgwKBgFqXrMGXGokgoa11BlvF\nknsUV/lycwX3y4AGXevcACtMtNrXUyX5BvX940bHnpnQm4obUTiMRxnkbsptych8\n7ElPxOk9hI3bDQkFS0kEWicA+wURTb/wL5UZNoyDqXaIl/wzgB2nzBP92LUhKwYX\nOu6nkhuMmCn5U6jZmNRXitll\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@bps7325.iam.gserviceaccount.com",
  "client_id": "116891894944946345546",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40bps7325.iam.gserviceaccount.com"

}
  ''';
  static const credentialAlternatif = r'''
{
  "type": "service_account",
  "project_id": "kodsa-318314",
  "private_key_id": "7006b17f7951b7fe2f3c3008c473e8b5b040defa",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDKun4AO1mYULSm\nySPLxiSM0+w2wxZt7o2X0loPbLJeZLxqIiazHAYSGNHTyJpWuRM0GgsfhM4qe45k\n2u+Fmlabpkm6edx8YzdoYLeN1iDjCvisA64gXoMwsBbmWJh0VDGyk9HPdYiqkLIW\niq8Ox9owInhzzAfIWeTeC+7/PrGDkZwehNVM9fOyZdiP+Nt8BNJwGIyvWbFeBAof\nUUwziWS61zK281gywQadTqlG8R+23un5vIO+Bnr91HSXXaXXd5YaF9IPPzxIFU7n\ndX9LJpDmPiB3bbYMuV4iEE8ySPmC3/zhN+47HHDWk4QC6RteABY72smJfTzN+VH2\n72mKL19HAgMBAAECggEAVTi8iyBn843Jw2s+rwTmjITyAbtVDHWB9FarIVzSRrgW\nNI+SsSyQqL7iRiNILjizB+4CywcrG9TA8UjP89wDmH7483kS5P9YZXpy7x8ayBbu\nnnEVm+nfQHJlzgNkY1KZabaWNp30C6+0DaHTIWWGJUH4XMViaCjR+z4NBCO4v9OQ\nGoBfEQQJKe0Bi+NP7t+UtiXXv4KwVy5sZ30Q2k5pLkX6A+ZLCTjW5MC1lC8vYtuG\naIfsh2EXQDXF4R/GbXJ2e/MUSUuXBrAupH43xjOAPxvWbSJFIAUZ9lV30FiD8Pou\n1rcNVDfZL8jSVupkZb+hoCig8i8XUI0E8nxgofD/oQKBgQD3d23uKaVa4ArpNCEd\nDo/5gK4QEx5LCgO7RJyyW344A1LY1VN59/+55ebMoD5xzHi9U9UOJ413VIkhVEsr\n1p2MAeKejmvE/jmfjtITFmzyk1gS82AoCTHra7PAMv4i4NYixCMCFjxIaWrbtHYp\n70X7tQc+37ZhWoaGGhBROAIg7wKBgQDRuCB/FvIrAcMuBFuoVDktQU/uPcN1GpsC\nI4Ynx1yZAHMx7RHRokCx0b5U/tFsA9UqzsSkEuYUityxB89MVIKoAJdTF9zPmVUV\nnCD+s+xjCLC9DhKgOUqooYPhvJcDXsyLNupAlGh/oLY7cQcasEYbDInmaCLpDt3Y\n250vMgd3KQKBgHxOKZIwqTb0w4ZRATEvV3LlCIpakCTxat5uoKeW/df1E3CH996U\njIg8y6qN89AF/cBck/EAPTdr51YumXPz4j+p0sQClm/lo9xaSXv9D8zp5pveVLbH\np6Ox/iDVfILYnbfo/gzWToGxMlQaWiDGaEj/rhwPE/XjGx/Rh9DEaY1RAoGAPFOe\n5XAQUVa8cmxGgXFY0S/MclfJ9dGlbUQSvzaV6F08xcvQKGFoAr625XQ3gb7Ifvvj\njN7y2E3plfMNKoPU4cbpwLlIh18wHns+8oWHJiXF0VxO91ADreZoLXM2bX3DkPhH\nAjSuqqfsQ8ULqh2yzO0abfDeufPQ1SS3XnAhvaECgYEAwJDvicOBfQJvzJxmjuJe\njj6NeH7tm8Q7pWnOwuNMjiPA73oIMezkmT+Sktiyf8BYi1eLxLDS/mvgyy+PUFzK\n4OUJDpYtDvm/HQD3nB7uOq4a7Vl8DNzDGrqiW4slUL6FPjKFD3gefMpw37GsB3AM\n/B5uaiMUbjAA0mn/JB5cogM=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@kodsa-318314.iam.gserviceaccount.com",
  "client_id": "107311333604592493220",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40kodsa-318314.iam.gserviceaccount.com"
}
''';
  static const credentialSuper = r'''
{
  "type": "service_account",
  "project_id": "pareparekota",
  "private_key_id": "e9a4958948b394446ed284c79d0ee10dc86eec35",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCl+Cnn6XHqA433\nGAqgVMnebqzCzRPX1Zov02Bji8PcSo+Segy8LzmPAnQkMbIR7a6jriwbPBVe4psP\nFDRvtzub2sYu0zO47OQrEw/K6ozQ3z9rpgbnH/3HKOHqTy1XaKdJl3jYhb7roSoo\n22I3AWd3aF4vZsT6+eh5rE5xgQG60/ozFwKvQM/xB0Z8A7toXPyOfCcdiLOpOW+3\nQe7kwU1SWV13CdPhTbc7wgJfjUW5yg1ULjXcvxxgXsUuD0D+Z/gJ2LDK7T9m/17i\nvPnq2xH5NzhQ28S0JgRj3qdaSeo3oXmhEGRpRNhezqJfceeYEHigRfidahSSO1Km\nUO8TWd33AgMBAAECggEACuNmgGfwyLz19dV2cQFPAxA4tkj0+c5yIJwZ8T3smgms\nNJxcNIZWnNq42t0FxSZWNDfLfffpoQF10b3uGLwpJXbrVIwXkxS7fVXxTcsodNWI\nmBvazRPstsGoXJJYM6lSfEH7NB1GIrg+h1KpNVmau5s1vp9b4ek+Rqk2tjyT6/k7\n/KICk/SGEF5lgMaqK0YllfXe98NmvV02zu1zVFMIeVXuYU1HEVNHHY2kuMQOCI7N\nCMmvHfrqxDcCbmc3miUnzCWO+SEI3WzLUZkJB/R3mcf9ev+xQUkr25HcJftxfXy2\nBawYrQewvtvxGhAANWI25zHi2+FiUS36XjcRt5JeyQKBgQDj5/SmRtVsmaXYL18A\n3kip9va56osDsOl0nC9lSS9TqMOTjP87HUOtyIgK3/QIfz44yO5pnfntDJMo0qpC\nn22GhZrVWmkAY+YcvoYbFodMoF/2m0sonrL2oQkrH14y07FCGYpdpjez3/ykJndM\nRMpEKRUiU1gZFVO/Wl1uJ1y9iQKBgQC6bass7OTaKdVdy8j2j6hSd2al0ME49bmg\npz+JLK6JnNGsyM7D1pDfdBMKMzCi3B9tzJz05wiKr7YjIpUxQfdSJlpPn8rVU+rN\nHlQRaSbuvlqt/JaE3SCUbicLaGe+XGTytL0NVXFdYnecZScgvE+Bk99pEuPqPywE\nDq+4I3JffwKBgQDT8bu4AnmqVD1CDdPJB+8FeTE79p2vIhAJrNH63JORtomjJ2WY\ngP+Wlr3Fdz4HxOWFg38MY6iwRZh5R2ilKoR9rLQwI7MwdLbkFl66xDmxDhgQS50a\nunNuHpZbLwG4PNxEv2HI87IrqmrV8RvSpsp/lsEbuexc71OBybTHov2BGQKBgHU9\nyPvM0zN8QYnmQbEFsUaDfpNjEFEA/8dPxv4+kllKvPYbpyS0CJHujpbIkJqrMjy8\nBC1kKhQF4tZ/xjGfGamZIwyWIlo8lxp+K0JzzZ8xKRfoFMTjx7xw9a8P7sZhlr6n\n+YisJkojRbOeTZghtSJ5W3PaBGlpZwX6MnnsGN6DAoGAVRKnH3Mv1yyxUYB0dEOf\nd3PFghXfRKRl6znQnaGFUg8oEAEi/sIp0Fq3z8OoOP8MrfjFPI2qb03l8w+N2DNU\nVQjABzBbL7yfH4u9srKBjduSfx8ejy85tVLY6cqtfD67qcX+1yIUvzN+CidogcBz\nVBe9mXdJkV+o87hLOKIsDFM=\n-----END PRIVATE KEY-----\n",
  "client_email": "dd64mis@pareparekota.iam.gserviceaccount.com",
  "client_id": "109042122345842331139",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/dd64mis%40pareparekota.iam.gserviceaccount.com"
}
''';
}

class Ikon {
  static Icon back = const Icon(Icons.arrow_back_ios, color: Color(0xff575171));
}

class TeksStyle {
  static const TextStyle judul =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18);
  static const TextStyle subjudul =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16);
  static const TextStyle dashboardPutih =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
  static const TextStyle judulPutih =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16);
  static const TextStyle subjudulPutih =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12);
  static const TextStyle judulTanya =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15);
  static const TextStyle subjudulTanya =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12);
  static const TextStyle keterangan =
      TextStyle(color: Colors.brown, fontWeight: FontWeight.w300, fontSize: 12);
}

class Warna {
  static const Color myColor = Colors.blue;
  static const Color background = Color(0xfff6f1eb);
  static const Color card = Color(0xffFEF5ED);
  static const Color cardBlue = Color(0xFFF0F4F8);
}
