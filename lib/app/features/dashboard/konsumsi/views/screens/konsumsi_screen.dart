part of konsumsi;

class KonsumsiScreen extends StatelessWidget {
  const KonsumsiScreen({Key? key}) : super(key: key);

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
                                (komoditiData.foto == "")
                                    ? Image.asset(ImageRaster.noPhoto,
                                        height: 70)
                                    : SizedBox(
                                        width: 100,
                                        child:
                                            FotoZoom(link: komoditiData.foto!)),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: Text(
                                    "${komoditiData.rincian}",
                                    style: const TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Get.to(() => KomoditasScreen(
                                          komoditiData: komoditiData));
                                    },
                                    child: const Icon(Icons.info_outline))
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
                            child: PageView.builder(
                              physics: const BouncingScrollPhysics(),
                              controller: c.komoditiHalamaanCtrl,
                              onPageChanged: (value) {
                                c.pindahKomoditi(value);
                              },
                              itemBuilder: (context, index) {
                                return konsumsi(
                                    c, c.filterlistkomoditi[index], context);
                              },
                              itemCount: c.filterlistkomoditi.length,
                            ),
                          ),
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
                              c.simpan(false);
                            } else {
                              c.simpan(true);
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

  CustomScrollView konsumsi(
      KonsumsiController c, KomoditiData komoditiData, BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: (c.isExpanded)
                        ? const Color(0xfff6f1eb)
                        : Warna.cardBlue,
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
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
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          var a = c.filterkonsumsiTerpilih
                              .map((e) => double.tryParse(e.nilai ?? "0") ?? 0)
                              .sum;
                          var b = c.filterkonsumsiTerpilih
                              .map((e) => double.tryParse(e.banyak ?? "0") ?? 0)
                              .sum;
                          return Center(
                            child: Text((c.filterkonsumsiTerpilih.isEmpty)
                                ? "Tidak ada konsumsi"
                                : "$b ${komoditiData.satuan} : Rp $a [${c.filterkonsumsiTerpilih.length}]"),
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
                                          MainAxisAlignment.spaceBetween,
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
                                          "${e.banyakKonv} ${e.konversi} : Rp.  ${e.harga} [${e.nilai}]",
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
              //Banyak
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      autofocus: true,
                      focusNode: c.banyakNode,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(c.hargaNode);
                      },
                      controller: c.banyakText,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
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
                        labelText: 'Banyak',
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        if (c.filterlistKonversi.length > 1) {
                          Get.defaultDialog(
                              title: "Pilih Satuan",
                              content: SizedBox(
                                  child: Wrap(
                                      spacing: 5,
                                      runSpacing: 7,
                                      children: c.filterlistKonversi
                                          .map((e) => SelectableBox(e.nama!,
                                                  isSelected: e.nama! ==
                                                      c.konversi.nama,
                                                  onTap: () {
                                                c.konversi = c.listKonversi
                                                    .firstWhere((element) =>
                                                        element.nama ==
                                                        e.nama!);
                                                c.update();
                                                Get.back();
                                              }))
                                          .toList())));
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Warna.cardBlue,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: Center(
                            child: Text((c.konversi.konversi == null)
                                ? komoditiData.satuan!
                                : c.konversi.nama!)),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
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
                                            .map((e) => SelectableBox(e.waktu!,
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
                                ? komoditiData.waktu!
                                : c.waktu.waktu!)),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              //Harga
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: c.hargaText,
                      focusNode: c.hargaNode,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(c.catatanNode);
                      },
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [ThousandsFormatter()],
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
                        labelText: 'Harga',
                      ),
                    ),
                  ),
                  const Spacer(),
                  (c.statusKonsumsi != "Subsidi")
                      ? const Spacer()
                      : Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: c.hargaSubsidiText,
                            focusNode: c.hargaNode,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context)
                                  .requestFocus(c.catatanNode);
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [ThousandsFormatter()],
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
                              labelText: 'Harga\nSubsidi',
                            ),
                          ),
                        ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        if (c.filterlistKonversi.length > 1) {
                          Get.defaultDialog(
                              title: "Pilih Satuan",
                              content: SizedBox(
                                  child: Wrap(
                                      spacing: 5,
                                      runSpacing: 7,
                                      children: c.filterlistKonversi
                                          .map((e) => SelectableBox(e.nama!,
                                                  isSelected: e.nama! ==
                                                      c.satuanHarga.nama,
                                                  onTap: () {
                                                c.satuanHarga = c.listKonversi
                                                    .firstWhere((element) =>
                                                        element.nama == e.nama);
                                                c.update();
                                                Get.back();
                                              }))
                                          .toList())));
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Warna.cardBlue,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: Center(
                            child: Text((c.satuanHarga.konversi == null)
                                ? komoditiData.satuan!
                                : c.satuanHarga.nama!)),
                      ),
                    ),
                  ),
                  // const Spacer(flex: 4),
                ],
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
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      blurRadius: 2, // blur radius
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Status Peroleh  Konsumsi Barang",
                      style: TeksStyle.judulTanya,
                      textAlign: TextAlign.start,
                    ),
                    Wrap(
                        spacing: 5,
                        runSpacing: 7,
                        alignment: WrapAlignment.center,
                        children: {
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
                        }
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
              //Art
              (c.komoditiTerpilih.kategori != "art")
                  ? const SizedBox()
                  : Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 10),
                      margin: const EdgeInsets.only(
                          left: 8, right: 8, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: Warna.cardBlue,
                        borderRadius:
                            BorderRadius.circular(30), //border corner radius
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), //color of shadow
                            blurRadius: 2, // blur radius
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            const Text(
                              "ART yang Konsumsi",
                              style: TeksStyle.judulTanya,
                              textAlign: TextAlign.start,
                            ),
                            Wrap(
                                spacing: 5,
                                runSpacing: 7,
                                alignment: WrapAlignment.center,
                                children: c.rutaTerpilih.namaArt!
                                    .map((e) => SelectableBox(
                                          e,
                                          isSelected: e == c.artPilihan,
                                          onTap: () {
                                            c.artPilihan = e;
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
                            if (komoditiData.lainnya == "1") {
                              c.update();
                              c.catatanText.selection = TextSelection.collapsed(
                                  offset: c.catatanText.text.length);
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
    );
  }
}
