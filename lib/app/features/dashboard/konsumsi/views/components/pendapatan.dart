part of konsumsi;

class Pendapatan extends StatelessWidget {
  const Pendapatan({
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
                                  var a = NumberFormat.decimalPattern().format(c
                                      .filterkonsumsiTerpilih
                                      .map((e) =>
                                          double.tryParse(e.nilai ?? "0") ?? 0)
                                      .sum);

                                  return Center(
                                    child: Text((c
                                            .filterkonsumsiTerpilih.isEmpty)
                                        ? "Tidak ada konsumsi"
                                        : "Rp $a [${c.filterkonsumsiTerpilih.length}]"),
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
                                                  "${e.statusKonsumsi} : Rp.  ${NumberFormat.decimalPattern().format(int.tryParse(e.nilai!) ?? 0)}",
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
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Warna.cardBlue,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: Center(
                            child: Text(c.filterlisttransfer[index].waktu!)),
                      ),
                      const SizedBox(height: 10),
                      //Custom
                      customTanya(c, context, index),
                      const SizedBox(height: 10),

                      const SizedBox(height: 10),
                      //Status Konsumsi
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
                                    if (c.filterlisttransfer[index].lainnya ==
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
    var sub = c.filterlisttransfer[index].sub!;
    var data = c.filterlisttransfer[index];
    switch (sub) {
      case "D. PENDAPATAN KEPEMILIKAN SELAMA SETAHUN TERAKHIR":
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
            ),
            const SizedBox(height: 10),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Warna.cardBlue,
                borderRadius: BorderRadius.circular(30), //border corner radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    blurRadius: 2, // blur radius
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Status Perolehan",
                    style: TeksStyle.judulTanya,
                    textAlign: TextAlign.start,
                  ),
                  Wrap(
                      spacing: 5,
                      runSpacing: 7,
                      alignment: WrapAlignment.center,
                      children: ({'Diterima', 'Dibayar'})
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
          ],
        );
      case "E. TRANSFER BERJALAN (SELAIN ASET) SELAMA SETAHUN TERAKHIR":
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
            ),
            const SizedBox(height: 10),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Warna.cardBlue,
                borderRadius: BorderRadius.circular(30), //border corner radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    blurRadius: 2, // blur radius
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Jenis Barang",
                    style: TeksStyle.judulTanya,
                    textAlign: TextAlign.start,
                  ),
                  Wrap(
                      spacing: 5,
                      runSpacing: 7,
                      alignment: WrapAlignment.center,
                      children: ({'Uang', 'Barang/Jasa'})
                          .map((e) => SelectableBox(
                                e,
                                isSelected: e == c.konversiLain,
                                onTap: () {
                                  c.konversiLain = e;
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
            const SizedBox(height: 10),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Warna.cardBlue,
                borderRadius: BorderRadius.circular(30), //border corner radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    blurRadius: 2, // blur radius
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Status Perolehan",
                    style: TeksStyle.judulTanya,
                    textAlign: TextAlign.start,
                  ),
                  Wrap(
                      spacing: 5,
                      runSpacing: 7,
                      alignment: WrapAlignment.center,
                      children: ({'Diterima', 'Dibayar'})
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
          ],
        );
      case "F. TRANSFER MODAL / ASET SELAMA SETAHUN TERAKHIR":
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
            ),
            const SizedBox(height: 10),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Warna.cardBlue,
                borderRadius: BorderRadius.circular(30), //border corner radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    blurRadius: 2, // blur radius
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Jenis Barang",
                    style: TeksStyle.judulTanya,
                    textAlign: TextAlign.start,
                  ),
                  Wrap(
                      spacing: 5,
                      runSpacing: 7,
                      alignment: WrapAlignment.center,
                      children: ({
                        'Bangunan, Alat Produksi, Kendaraan, dll.',
                        'Lahan/Tanah dan Barang Berharga'
                      })
                          .map((e) => SelectableBox(
                                e,
                                isSelected: e == c.konversiLain,
                                onTap: () {
                                  c.konversiLain = e;
                                  c.update();
                                  // Get.back();
                                },
                                width: 150,
                                height: 50,
                              ))
                          .toList()),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Warna.cardBlue,
                borderRadius: BorderRadius.circular(30), //border corner radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    blurRadius: 2, // blur radius
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Status Perolehan",
                    style: TeksStyle.judulTanya,
                    textAlign: TextAlign.start,
                  ),
                  Wrap(
                      spacing: 5,
                      runSpacing: 7,
                      alignment: WrapAlignment.center,
                      children: ({'Diterima', 'Dibayar'})
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
          ],
        );
      case "G. PENAMBAHAN DAN PENGURANGAN ASET SELAMA SETAHUN TERAKHIR":
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
            ),
            const SizedBox(height: 10),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Warna.cardBlue,
                borderRadius: BorderRadius.circular(30), //border corner radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    blurRadius: 2, // blur radius
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Status Perolehan",
                    style: TeksStyle.judulTanya,
                    textAlign: TextAlign.start,
                  ),
                  Wrap(
                      spacing: 5,
                      runSpacing: 7,
                      alignment: WrapAlignment.center,
                      children: ({
                        'Penambahan\n(pembelian, pemberian, pembuatan sendiri)',
                        'Pengurangan\n(penjualan, pemberian kepada pihak lain)'
                      })
                          .map((e) => SelectableBox(
                                e,
                                isSelected: e == c.statusKonsumsi,
                                onTap: () {
                                  c.statusKonsumsi = e;
                                  c.update();
                                  // Get.back();
                                },
                                width: 150,
                                height: 70,
                              ))
                          .toList()),
                ],
              ),
            ),
          ],
        );
      case "BLOK VII. TRANSAKSI KEUANGAN RUMAH TANGGA SELAMA SETAHUN TERAKHIR":
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
            ),
            const SizedBox(height: 10),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Warna.cardBlue,
                borderRadius: BorderRadius.circular(30), //border corner radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    blurRadius: 2, // blur radius
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Status Perolehan",
                    style: TeksStyle.judulTanya,
                    textAlign: TextAlign.start,
                  ),
                  Wrap(
                      spacing: 5,
                      runSpacing: 7,
                      alignment: WrapAlignment.center,
                      children: ({'Penerimaan', 'Pengeluaran'})
                          .map((e) => SelectableBox(
                                e,
                                isSelected: e == c.statusKonsumsi,
                                onTap: () {
                                  c.statusKonsumsi = e;
                                  c.update();
                                  // Get.back();
                                },
                                width: 150,
                                height: 70,
                              ))
                          .toList()),
                ],
              ),
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}
