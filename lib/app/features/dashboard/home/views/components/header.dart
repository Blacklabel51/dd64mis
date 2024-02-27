part of home;

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataController = Get.put(HomeController());
    return GetBuilder<CloudController>(
        autoRemove: false,
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _title(
                    (controller.petugasTerpilih.nama != null)
                        ? "${controller.petugasTerpilih.nama}/${controller.petugasTerpilih.status}"
                        : "",
                    context),
                const Spacer(),
                SearchButton(onPressed: () {
                  controller.getPetugas();
                  Get.bottomSheet(Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        color: Colors.white,
                        height: 250,
                        child: Center(
                          child: ListView(
                            children: [
                              DropdownSearch<Kabupaten>(
                                asyncItems: (String? filter) async {
                                  var kabkota = dataController.dataKab;

                                  return kabkota;
                                },
                                itemAsString: (Kabupaten u) => u.kabkota!,
                                onChanged: (value) {
                                  dataController
                                      .ambilkabupaten(value!.kabkota!);
                                },
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                                labelText: "Pilih Kabupaten")),
                              ),
                              DropdownSearch<Petugas>(
                                asyncItems: (String? filter) async {
                                  var kabkota = controller.dataPetugas
                                      .where((element) =>
                                          element.kabkota ==
                                          dataController.kabupatenSementara)
                                      .toList();
                                  return kabkota;
                                },
                                itemAsString: (Petugas u) =>
                                    "${u.nama!} - ${u.status!}",
                                onChanged: (value) {
                                  controller.sementaraPetugas(value!);
                                },
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                                labelText: "Pilih Petugas")),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      content: Align(
                                        child: SizedBox(
                                          height: 240,
                                          child: Lottie.asset(
                                              'assets/animasi/success.json'),
                                        ),
                                      ),
                                      title: "Update Petugas",
                                      confirm: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xff3e786f))),
                                          onPressed: () {
                                            controller.pilihPetugas(
                                                controller.petugasSementara);
                                            controller.getSampel();
                                            controller.getPertanyaan();
                                            controller.getUpdating();
                                            controller.getPetugas();
                                            Get.back(closeOverlays: true);
                                          },
                                          child: const Text("Siap")),
                                    );
                                  },
                                  child: const Text("Save"))
                            ],
                          ),
                        ),
                      )));
                }),
              ],
            ));
  }

  Widget _title(String data, context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Text(
        "Hi, $data",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
