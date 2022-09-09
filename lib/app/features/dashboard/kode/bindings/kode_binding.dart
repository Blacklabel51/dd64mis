part of kode;

class KodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KodeController());
  }
}
