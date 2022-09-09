part of cloud;

class CardPemutakhiran extends StatelessWidget {
  const CardPemutakhiran(
      {required this.folderData, required this.dataSampelan, Key? key})
      : super(key: key);

  final List<Sampel> folderData;
  final List<Map<String, dynamic>> dataSampelan;

  @override
  Widget build(BuildContext context) {
    var pendataan = {"1": "Sudah", "0": "Belum"};
    final controller = Get.put(CloudController(), permanent: true);
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
                children: (folderData)
                    .map(
                      (data) => GestureDetector(
                        onTap: () {
                          controller.nilailah(data.sPemutakhiran!);
                          controller.values = {};
                          Get.defaultDialog(
                              title: "",
                              content: Column(
                                children: [
                                  const Text("Status Pemutakhiran",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w700)),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: GetBuilder<CloudController>(
                                        builder: (c) => Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: pendataan.entries
                                                .map((e) => SelectableBox(
                                                        e.value,
                                                        width: 100,
                                                        isSelected: c.nilai ==
                                                            e.value, onTap: () {
                                                      c.nilailah(e.value);
                                                      c.onUpdate(
                                                          "sPemutakhiran",
                                                          e.value);
                                                    }))
                                                .toList()),
                                      )),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    const Expanded(
                                        flex: 7,
                                        child: Text("Jumlah Keluarga Awal",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.w700))),
                                    Expanded(
                                        flex: 3,
                                        child: TextFormField(
                                          autofocus: true,
                                          initialValue: data.keluargaAwal,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 10.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          onChanged: (value) {
                                            controller.onUpdate(
                                                "keluargaAwal", value);
                                          },
                                        ))
                                  ]),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    const Expanded(
                                        flex: 7,
                                        child: Text(
                                            "Jumlah Keluarga hasil updating",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.w700))),
                                    Expanded(
                                        flex: 3,
                                        child: TextFormField(
                                          initialValue: data.keluargaUpdate,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 10.0),
                                          ),
                                          // onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          onChanged: (value) {
                                            controller.onUpdate(
                                                "keluargaUpdate", value);
                                          },
                                        ))
                                  ]),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    const Expanded(
                                        flex: 7,
                                        child: Text(
                                            "Jumlah Ruta hasil updating",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.w700))),
                                    Expanded(
                                        flex: 3,
                                        child: TextFormField(
                                          initialValue: data.rutaUpdate,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 10.0),
                                          ),
                                          // onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          onChanged: (value) {
                                            controller.onUpdate(
                                                "rutaUpdate", value);
                                          },
                                        ))
                                  ])
                                ],
                              ),
                              confirm: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(120, 50),
                                      primary: const Color(0xff3e786f)),
                                  onPressed: () {
                                    controller.updateSampel(
                                        data.no!, controller.values);
                                    Get.back(closeOverlays: true);
                                    Get.snackbar(
                                        "Status Pengiriman", "Berhasil",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.amber,
                                        duration:
                                            const Duration(milliseconds: 800));
                                    Future.delayed(
                                        const Duration(milliseconds: 1500), () {
                                      controller.getSampel();
                                    });
                                  },
                                  child: const Text("Simpan",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700))));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: Container(
                            // height: 112,
                            // width: width ?? 200,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffFEF5ED),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: .2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: (data.sPemutakhiran != "Sudah")
                                      ? const Icon(
                                          Icons.sentiment_neutral_rounded,
                                          color: Colors.grey)
                                      : const Icon(
                                          Icons.sentiment_satisfied_sharp,
                                          color: Colors.greenAccent),
                                  title: Text(
                                    "${data.nks} - ${data.desa} - ${data.bs}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // _typeIcons(fileType),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList())));
  }
}
