part of konsumsi;

class _Header extends StatelessWidget {
  _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KonsumsiController>(
        builder: (c) => Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 40,
                    child: FittedBox(
                      child: FloatingActionButton.extended(
                        heroTag: 'send',
                        label: Text('Kirim ${c.tabController.index}'),
                        icon: const Icon(Icons.near_me),
                        backgroundColor:
                            ((c.values.isNotEmpty && c.selectabIndex == 0) ||
                                    ((c.selectabIndex < 4) &&
                                        (c.konsumsiTerpilih !=
                                            c.cekkonsumsiTerpilih)))
                                ? Colors.greenAccent
                                : Colors.grey,
                        onPressed: () {
                          if (c.selectabIndex == 0) {
                            (c.values.isNotEmpty)
                                ? c.simpanArt()
                                : Get.snackbar(
                                    "Perhatian", "Tidak ada Perubahan",
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 2));
                          } else if (c.selectabIndex < 4) {
                            c.kirim();
                          } else {
                            Get.snackbar("Perhatian", "Belum ada isinya",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 2));
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      log(c.dataSampel.length.toString());
                      Get.defaultDialog(
                          title: ("Pilih Rumah Tangga"),
                          content: GetBuilder<KonsumsiController>(
                              // init: KodeController(),
                              builder: (controller) => SizedBox(
                                    height: Get.height / 2,
                                    width: Get.width / 1.5,
                                    child: GroupedListView<Sampel, String>(
                                      elements: controller.dataSampel,
                                      useStickyGroupSeparators: true,
                                      groupBy: (e) =>
                                          "${e.desa} - ${e.nks} - ${e.bs}",
                                      groupSeparatorBuilder:
                                          (String groupByValue) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Container(
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Warna.card,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(14)),
                                          ),
                                          child:
                                              Center(child: Text(groupByValue)),
                                        ),
                                      ),
                                      itemBuilder: (context, Sampel e) =>
                                          GestureDetector(
                                        onTap: () {
                                          controller.pilihRuta(e.nks!, e.ruta!);
                                          Get.back();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Container(
                                            height: 50,
                                            decoration: const BoxDecoration(
                                              color: Warna.cardBlue,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(14)),
                                            ),
                                            child: Center(
                                                child: Text(e.namaRuta!)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )));
                    },
                    child: Align(
                        alignment: Alignment.center,
                        child: _title((c.rutaTerpilih.namaRuta == null)
                            ? "Belum Pilih Ruta"
                            : c.rutaTerpilih.namaRuta!))),
                SearchBarAnimation(
                    // hintText: "Cari Disini",
                    enableKeyboardFocus: true,
                    durationInMilliSeconds: 500,
                    secondaryButtonWidget: const Icon(Icons.search),
                    textEditingController: c.cariMakanan,
                    isOriginalAnimation: false,
                    buttonBorderColour: Colors.black45,
                    trailingWidget: const Icon(Icons.search),
                    buttonWidget: const Icon(Icons.search),
                    onChanged: (text) {
                      c.search(text);
                    },
                    onCollapseComplete: () {
                      c.cariMakanan.clear();
                      c.search('');
                    },
                    isSearchBoxOnRightSide: false),
              ],
            ));
  }

  Widget _title(String data) {
    return Text(
      data,
      style: TeksStyle.judul,
    );
  }
}
