part of home;

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CloudController>(
        autoRemove: false,
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _title(
                    (controller.petugasTerpilih.nama != null)
                        ? "${controller.petugasTerpilih.nama}/${controller.petugasTerpilih.kodePetugas}/${controller.petugasTerpilih.status}"
                        : "",
                    context),
                Spacer(),
                SearchButton(onPressed: () {
                  controller.getPetugas();
                  Get.bottomSheet(Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        color: Colors.white,
                        height: 200,
                        child: Center(
                          child: ListView(
                            children: [
                              DropdownSearch<Petugas>(
                                asyncItems: (String? filter) async {
                                  var kabkota = controller.dataPetugas;
                                  return kabkota;
                                },
                                itemAsString: (Petugas u) => u.nama!,
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
                                      content: Lottie.asset(
                                          'assets/animasi/success.json'),
                                      title: "Update Petugas",
                                      confirm: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xff3e786f))),
                                          onPressed: () {
                                            controller.pilihPetugas(
                                                controller.petugasSementara);
                                            controller.getSampel();
                                            controller.getPertanyaan();
                                            Get.back(closeOverlays: true);
                                          },
                                          child: Text("Siap")),
                                    );
                                  },
                                  child: Text("Save"))
                            ],
                          ),
                        ),
                      )));
                }),
              ],
            ));
  }

  Widget _title(String data, context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Text(
        "Hi, $data",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
