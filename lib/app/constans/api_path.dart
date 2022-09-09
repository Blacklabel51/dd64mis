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
}

class Warna {
  static const Color myColor = Colors.blue;
  static const Color background = Color(0xfff6f1eb);
  static const Color card = Color(0xffFEF5ED);
  static const Color cardBlue = Color(0xFFF0F4F8);
}
