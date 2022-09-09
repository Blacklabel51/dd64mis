part of konsumsi;

class KonsumsiNon extends StatelessWidget {
  const KonsumsiNon({
    required this.index,
    Key? key,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KonsumsiController>(
        init: KonsumsiController(),
        // autoRemove: false,
        builder: (c) => CustomScrollView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      //Rekap
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: (c.isExpanded)
                                ? const Color(0xfff6f1eb)
                                : Warna.cardBlue,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14)),
                          ),
                          child: ExpansionPanelList(
                            elevation: 0,
                            expansionCallback: (int index, bool isExpanded) {
                              c.isExpanded = !isExpanded;
                              c.update();
                            },
                            children: [
                              ExpansionPanel(
                                backgroundColor: (c.isExpanded)
                                    ? const Color(0xfff6f1eb)
                                    : Warna.cardBlue,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  var a = c.filterkonsumsiTerpilih
                                      .map((e) =>
                                          double.tryParse(e.nilai ?? "0") ?? 0)
                                      .sum;

                                  return Center(
                                    child: Text(
                                        "Rp $a [${c.filterkonsumsiTerpilih.length}]"),
                                  );
                                },
                                body: Column(
                                  children: c.filterkonsumsiTerpilih
                                      .map((e) => Container(
                                          height: 40,
                                          color: (c.editDataKonsumsi == e)
                                              ? Colors.greenAccent
                                              : null,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    c.edit(e);
                                                  },
                                                  child: const Icon(
                                                    Icons.edit,
                                                    color: Color(0xff3e786f),
                                                  ),
                                                ),
                                                Text(
                                                  "${e.konversi} : Rp.  ${e.nilai}",
                                                  textAlign: TextAlign.start,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    c.hapus(e);
                                                  },
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.pinkAccent,
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
                      //Custom
                      customTanya(c, context, index),

                      const SizedBox(height: 10),
                      //Waktu
                      GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                              title: "Pilih Lama Konsumsi",
                              content: GetBuilder<KonsumsiController>(
                                  // init: Kodec(),
                                  builder: (c) => SizedBox(
                                      child: Wrap(
                                          spacing: 5,
                                          runSpacing: 7,
                                          children: c.listWaktu
                                              .getRange(5, 11)
                                              .map((e) => SelectableBox(
                                                      e.waktu!,
                                                      height: 45,
                                                      isSelected: e.waktu ==
                                                          c.waktu.waktu,
                                                      onTap: () {
                                                    c.waktu = c.listWaktu
                                                        .firstWhere((element) =>
                                                            element.waktu ==
                                                            e.waktu);
                                                    c.update();
                                                    Get.back();
                                                  }))
                                              .toList()))));
                        },
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Warna.cardBlue,
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: Center(
                              child: Text((c.waktu.waktu == null)
                                  ? c.filterlistkomoditiNonMakan[index].waktu!
                                  : c.waktu.waktu!)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //Status Konsumsi
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Warna.cardBlue,
                          borderRadius:
                              BorderRadius.circular(30), //border corner radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), //color of shadow
                              blurRadius: 2, // blur radius
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Status Peroleh  Konsumsi Barang",
                              style: TeksStyle.judulTanya,
                              textAlign: TextAlign.start,
                            ),
                            Wrap(
                                spacing: 5,
                                runSpacing: 7,
                                alignment: WrapAlignment.center,
                                children:
                                    ((c.filterlistkomoditiNonMakan[index].no ==
                                                "199")
                                            ? {
                                                "Milik Sendiri",
                                                "Kontrak",
                                                "Sewa",
                                                "Bebas Sewa",
                                                "Dinas",
                                                "Lainnya"
                                              }
                                            : {
                                                'Pembelian',
                                                'Hutang',
                                                'Subsidi',
                                                'Dari Toko',
                                                'Punya Sendiri',
                                                'Dari Pemerintah',
                                                'Dari Ruta Lain',
                                                'Dari Badan Usaha',
                                                'Dari Nirlaba',
                                                'Dari Luar Negeri',
                                              })
                                        .map((e) => SelectableBox(
                                              e,
                                              isSelected: e == c.statusKonsumsi,
                                              onTap: () {
                                                c.statusKonsumsi = e;
                                                c.update();
                                                // Get.back();
                                              },
                                              width: 100,
                                              height: 50,
                                            ))
                                        .toList()),
                          ],
                        ),
                      ),
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
                                    if (c.filterlistkomoditiNonMakan[index]
                                            .lainnya ==
                                        "1") {
                                      c.update();
                                      c.catatanText.selection =
                                          TextSelection.collapsed(
                                              offset:
                                                  c.catatanText.text.length);
                                    }
                                  },
                                  focusNode: c.catatanNode,
                                  controller: c.catatanText,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    fillColor: const Color(0xffF1F0F5),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: const BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: const BorderSide(),
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
            ));
  }

  Widget customTanya(KonsumsiController c, BuildContext context, int index) {
    var custom = c.filterlistkomoditiNonMakan[index].custom!;
    var data = c.filterlistkomoditiNonMakan[index];
    switch (custom) {
      case "standar":
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                autofocus: true,
                focusNode: c.cPengeluaranNode,
                onFieldSubmitted: (v) {
                  // FocusScope.of(context).requestFocus(c.hargaNode);
                },
                inputFormatters: [ThousandsFormatter()],
                controller: c.hargaText,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  fillColor: const Color(0xffF1F0F5),
                  prefix: const Text("Rp."),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(),
                  ),
                  labelText: 'Pengeluaran',
                ),
              ),
            ),
          ],
        );
      case "listrik":
        return Column(
          children: [
            const Text(
              "Pilih Layanan PLN",
              style: TeksStyle.subjudul,
              textAlign: TextAlign.start,
            ),
            Wrap(
                spacing: 5,
                runSpacing: 7,
                children: ["pasca", "pra"]
                    .map((e) => SelectableBox("$e bayar",
                            isSelected: e == c.layananPln, onTap: () {
                          c.layananPln = e;
                          c.kwh();
                          c.update();
                        }))
                    .toList()),
            const SizedBox(height: 10),
            const Text(
              "Pilih Watt",
              style: TeksStyle.subjudul,
              textAlign: TextAlign.start,
            ),
            Wrap(
                spacing: 5,
                runSpacing: 7,
                children: [
                  "450",
                  "900 Subsidi",
                  "900 NonSubsidi",
                  "1300",
                  "2200",
                  "3500"
                ]
                    .map((e) => SelectableBox(
                          e,
                          isSelected: e == c.watts,
                          onTap: () {
                            c.watts = e;
                            c.kwh();
                            c.update();
                          },
                          width: 100,
                        ))
                    .toList()),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    autofocus: true,
                    focusNode: c.cPengeluaranNode,
                    inputFormatters: [ThousandsFormatter()],
                    controller: c.hargaText,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      c.hargaText.text = value;
                      c.hargaText.selection = TextSelection.collapsed(
                          offset: c.hargaText.text.length);
                      c.update();
                      c.kwh();
                    },
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF1F0F5),
                      prefix: const Text("Rp."),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(),
                      ),
                      labelText: 'Pengeluaran',
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                    flex: 3,
                    child: Container(
                        height: 55,
                        decoration: const BoxDecoration(
                          color: Warna.cardBlue,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: Center(child: Text("${c.bnykkwh} kwh"))))
              ],
            )
          ],
        );
      case "air":
        return Column(
          children: [
            const Text(
              "Pilih Golongan",
              style: TeksStyle.subjudul,
              textAlign: TextAlign.start,
            ),
            Wrap(
                spacing: 5,
                runSpacing: 7,
                children: ["Rumah Tangga 1", "Rumah Tangga 2", "Rumah Tangga 3"]
                    .map((e) => SelectableBox(e, isSelected: e == c.tarifair,
                            onTap: () {
                          c.tarifair = e;
                          c.air();
                          c.update();
                        }))
                    .toList()),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    autofocus: true,
                    focusNode: c.cPengeluaranNode,
                    onFieldSubmitted: (v) {
                      // FocusScope.of(context).requestFocus(c.hargaNode);
                    },
                    controller: c.hargaText,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [ThousandsFormatter()],
                    onChanged: (value) {
                      c.hargaText.text = value;
                      c.hargaText.selection = TextSelection.collapsed(
                          offset: c.hargaText.text.length);
                      c.air();
                      c.update();
                    },
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF1F0F5),
                      prefix: const Text("Rp."),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(),
                      ),
                      labelText: 'Pengeluaran',
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                    flex: 3,
                    child: Container(
                        height: 55,
                        decoration: const BoxDecoration(
                          color: Warna.cardBlue,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: Center(child: Text("${c.bnykmkubik} m3"))))
              ],
            )
          ],
        );
      case "oop":
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    autofocus: true,
                    focusNode: c.cOopNode,
                    onFieldSubmitted: (v) {
                      // FocusScope.of(context).requestFocus(c.hargaNode);
                    },
                    controller: c.oopText,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF1F0F5),
                      prefix: const Text("Rp."),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(),
                      ),
                      labelText: 'Pengeluaran',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Warna.cardBlue,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Layanan yang digunakan",
                          style: TeksStyle.judulTanya,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                            spacing: 5,
                            runSpacing: 7,
                            alignment: WrapAlignment.center,
                            children: c.listkomoditi
                                .where((e) => (e.no!.contains(data.no!) &&
                                    e.kelompok == "keterangan"))
                                .map((e) => SelectableBox(
                                      e.rincian!,
                                      isSelected:
                                          e.rincian! == c.statusKonsumsi,
                                      onTap: () {
                                        c.statusKonsumsi = e.rincian!;
                                        c.update();
                                      },
                                      width: 140,
                                      height: 50,
                                    ))
                                .toList()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      case "satuan":
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                autofocus: true,
                focusNode: c.banyakNode,
                onFieldSubmitted: (v) {
                  // FocusScope.of(context).requestFocus(c.hargaNode);
                },
                controller: c.banyakText,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  fillColor: const Color(0xffF1F0F5),
                  suffix: Text("${data.satuan}"),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(),
                  ),
                  labelText: 'Banyaknya',
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 3,
              child: TextFormField(
                autofocus: true,
                focusNode: c.hargaNode,
                onFieldSubmitted: (v) {
                  // FocusScope.of(context).requestFocus(c.hargaNode);
                },
                controller: c.hargaText,
                keyboardType: TextInputType.number,
                inputFormatters: [ThousandsFormatter()],
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  fillColor: const Color(0xffF1F0F5),
                  prefix: const Text("Rp."),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(),
                  ),
                  labelText: 'Pengeluaran',
                ),
              ),
            ),
          ],
        );

      default:
        return const SizedBox();
    }
  }
}
