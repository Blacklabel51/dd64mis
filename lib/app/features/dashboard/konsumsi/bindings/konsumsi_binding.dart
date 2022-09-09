part of konsumsi;

class konsumsiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KonsumsiController());
  }
}
