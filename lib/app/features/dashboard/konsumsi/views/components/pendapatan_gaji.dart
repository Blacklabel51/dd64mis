part of konsumsi;

class PendapatanGaji extends StatelessWidget {
  const PendapatanGaji({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KonsumsiController>(
        init: KonsumsiController(),
        builder: (c) {
          var komoditiData = c.komoditiTerpilih;
          return Scaffold(
            backgroundColor: const Color(0xfff6f1eb),
            body: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: Get.height * 0.1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: Text(
                                    "A. PENDAPATAN DARI UPAH/GAJI BAIK BERUPA UANG MAUPUN BARANG/JASA YANG DITERIMA SELAMA SETAHUN TERAKHIR",
                                    style: const TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Container(
                          width: Get.width,
                          padding: EdgeInsets.only(
                              top: 3,
                              left: Get.width * .08,
                              right: Get.width * .08),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              )),
                          child: Container(
                              color: Colors.white,
                              child: CustomScrollView(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                slivers: [
                                  SliverList(
                                    delegate: SliverChildListDelegate(
                                      [
                                        //Rekap
                                        Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14),
                                            decoration: BoxDecoration(
                                              color: (c.isExpanded)
                                                  ? const Color(0xfff6f1eb)
                                                  : Warna.cardBlue,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(14)),
                                            ),
                                            child: ExpansionPanelList(
                                              elevation: 0,
                                              expansionCallback:
                                                  (int index, bool isExpanded) {
                                                c.isExpanded = !isExpanded;
                                                c.update();
                                              },
                                              children: [
                                                ExpansionPanel(
                                                  backgroundColor: (c
                                                          .isExpanded)
                                                      ? const Color(0xfff6f1eb)
                                                      : Warna.cardBlue,
                                                  headerBuilder:
                                                      (BuildContext context,
                                                          bool isExpanded) {
                                                    var a = NumberFormat
                                                            .decimalPattern()
                                                        .format(c
                                                            .filterkonsumsiTerpilih
                                                            .map((e) =>
                                                                double.tryParse(
                                                                    e.nilai ??
                                                                        "0") ??
                                                                0)
                                                            .sum);

                                                    return Center(
                                                      child: Text((c
                                                              .filterkonsumsiTerpilih
                                                              .isEmpty)
                                                          ? "Tidak ada Pendapatan"
                                                          : "Rp $a [${c.filterkonsumsiTerpilih.length}]"),
                                                    );
                                                  },
                                                  body: Column(
                                                    children: c
                                                        .filterkonsumsiTerpilih
                                                        .map((e) => Container(
                                                            height: 40,
                                                            color: (c.editDataKonsumsi ==
                                                                    e)
                                                                ? Colors
                                                                    .greenAccent
                                                                : null,
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      c.edit(e);
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .edit,
                                                                      color: Color(
                                                                          0xff3e786f),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "${e.statusKonsumsi} : Rp.  ${NumberFormat.decimalPattern().format(int.tryParse(e.nilai!) ?? 0)}",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      c.hapus(
                                                                          e);
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .delete,
                                                                      color: Colors
                                                                          .pinkAccent,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            )))
                                                        .toList(),
                                                  ),
                                                  isExpanded: c.isExpanded,
                                                ),
                                              ],
                                            )),
                                        const SizedBox(height: 10),

                                        //Catatan
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 70,
                                                width: 79,
                                                child: Center(
                                                  child: TextFormField(
                                                    onChanged: (value) {
                                                      c.update();
                                                      c.catatanText.selection =
                                                          TextSelection.collapsed(
                                                              offset: c
                                                                  .catatanText
                                                                  .text
                                                                  .length);
                                                    },
                                                    focusNode: c.catatanNode,
                                                    controller: c.catatanText,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    decoration: InputDecoration(
                                                      fillColor: const Color(
                                                          0xffF1F0F5),
                                                      filled: true,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14),
                                                        borderSide:
                                                            const BorderSide(),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14),
                                                        borderSide:
                                                            const BorderSide(),
                                                      ),
                                                      labelText: 'Isi catatan',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 70),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  //Tombol
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FloatingActionButton.extended(
                          heroTag: 'home',
                          label: const Text('Home'),
                          icon: const Icon(Icons.home),
                          backgroundColor: Colors.blueAccent,
                          onPressed: () {
                            c.editKonsumsi = false;
                            c.update();
                            c.clear();
                            Get.back();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        FloatingActionButton.extended(
                          heroTag: 'clear',
                          label: const Text('Clear'),
                          icon: const Icon(Icons.cancel),
                          backgroundColor: Colors.pink,
                          onPressed: () {
                            c.clear();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        FloatingActionButton.extended(
                          heroTag: 'save',
                          label: Text((c.statusKonsumsi == "")
                              ? "Status\nKonsumsi"
                              : (c.catatanText.text == "" &&
                                      komoditiData.lainnya == "1")
                                  ? "Sebutkan"
                                  : (c.editKonsumsi)
                                      ? "Update"
                                      : 'Tambah'),
                          icon: Icon((c.editKonsumsi)
                              ? Icons.update
                              : Icons.check_rounded),
                          backgroundColor: (c.statusKonsumsi == "" ||
                                  (c.catatanText.text == "" &&
                                      komoditiData.lainnya == "1"))
                              ? Colors.grey
                              : (c.editKonsumsi)
                                  ? Colors.amberAccent
                                  : const Color(0xff3e786f),
                          onPressed: () {
                            if (c.statusKonsumsi == "" ||
                                (c.catatanText.text == "" &&
                                    komoditiData.lainnya == "1")) {
                            } else if (c.editKonsumsi) {
                              c.editKonsumsi = false;
                              c.simpanNon(false);
                              c.update();
                            } else {
                              c.simpanNon(true);
                              c.clear();
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
