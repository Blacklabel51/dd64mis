part of konsumsi;

class _Tabbar extends StatelessWidget {
  const _Tabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KonsumsiController>(
        // autoRemove: false,
        builder: (c) {
      log(c.listkomoditi.length.toString());
      return Container(
        width: Get.width,
        padding: EdgeInsets.only(
            top: 10, left: Get.width * .03, right: Get.width * .03),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: const BoxDecoration(
                  color: Color(0xffFEF5ED),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14212121),
                      blurRadius: 15.0,
                    ),
                  ],
                ),
                child: TabBar(
                  onTap: (int i) {},
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: const EdgeInsets.all(5),
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  tabs: const [
                    Tab(text: "Identitas"),
                    Tab(text: "Makanan"),
                    Tab(text: "Non Makanan"),
                    Tab(text: "Pendapatan"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      child: (c.rutaTerpilih.nks == null)
                          ? const SizedBox(
                              child: Center(
                                  child: Text("Pilih Ruta Terlebih Dahulu")),
                            )
                          : CustomScrollView(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              slivers: [
                                SliverToBoxAdapter(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                "Jumlah ART ",
                                                style: TeksStyle.judulTanya,
                                              ),
                                              (c.rutaTerpilih.namaArt!
                                                      .isNotEmpty)
                                                  ? Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.amber),
                                                      child: Text(
                                                          "${c.rutaTerpilih.namaArt!.length}"),
                                                    )
                                                  : const SizedBox()
                                            ],
                                          ),
                                          (c.rutaTerpilih.namaArt!.isEmpty)
                                              ? const SizedBox()
                                              : Text(
                                                  "${c.rutaTerpilih.namaArt!.map((e) => e)}",
                                                  style:
                                                      TeksStyle.subjudulTanya,
                                                ),
                                        ],
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                                title: "Anggota Rumah Tangga",
                                                content: GetBuilder<
                                                        KonsumsiController>(
                                                    // autoRemove: false,
                                                    builder: (c) {
                                                  var ind;
                                                  return Column(
                                                    children: [
                                                      Column(
                                                        children: c.rutaTerpilih
                                                            .namaArt!
                                                            .mapIndexed(
                                                                (int index, e) {
                                                          return SizedBox(
                                                            height: 30,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(e),
                                                                Row(
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        c.artText
                                                                            .text = e;
                                                                        c.indArt =
                                                                            index;
                                                                        log("y $ind");
                                                                        c.update();
                                                                      },
                                                                      child: const Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color:
                                                                              Colors.orangeAccent),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        c.rutaTerpilih
                                                                            .namaArt!
                                                                            .removeAt(index);
                                                                        c.indArt =
                                                                            -1;
                                                                        c.update();
                                                                      },
                                                                      child: const Icon(
                                                                          Icons
                                                                              .cancel,
                                                                          color:
                                                                              Colors.redAccent),
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      TextFormField(
                                                          onChanged: (value) {
                                                            c.artText.text =
                                                                value;
                                                            c.artText
                                                                    .selection =
                                                                TextSelection.collapsed(
                                                                    offset: c
                                                                        .artText
                                                                        .text
                                                                        .length);
                                                            c.update();
                                                          },
                                                          controller: c.artText,
                                                          decoration:
                                                              InputDecoration(
                                                                  filled: true,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            14),
                                                                    borderSide:
                                                                        const BorderSide(),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            14),
                                                                    borderSide:
                                                                        const BorderSide(),
                                                                  ),
                                                                  labelText:
                                                                      'Art',
                                                                  suffixIcon:
                                                                      GestureDetector(
                                                                    onTap: (() {
                                                                      c.artText
                                                                          .clear();
                                                                      c.update();
                                                                    }),
                                                                    child: const Icon(
                                                                        Icons
                                                                            .cancel),
                                                                  ))),
                                                      ElevatedButton(
                                                          style: ButtonStyle(
                                                              backgroundColor: MaterialStateProperty.all<
                                                                  Color>((c
                                                                          .artText
                                                                          .text
                                                                          .length <=
                                                                      2)
                                                                  ? Colors.grey
                                                                  : (c.indArt !=
                                                                          -1)
                                                                      ? Colors
                                                                          .amberAccent
                                                                      : Colors
                                                                          .greenAccent)),
                                                          onPressed: () {
                                                            if (c.artText.text
                                                                    .length <=
                                                                2) {
                                                              null;
                                                            } else if (c
                                                                    .indArt ==
                                                                -1) {
                                                              c.rutaTerpilih
                                                                  .namaArt!
                                                                  .add(c.artText
                                                                      .text);
                                                              c.artText.clear();
                                                            } else {
                                                              c.rutaTerpilih
                                                                      .namaArt![
                                                                  c
                                                                      .indArt] = c
                                                                  .artText.text;
                                                              c.indArt = -1;
                                                              c.artText.clear();
                                                              log("cek ${c.indArt}");
                                                              c.update();
                                                            }

                                                            c.update();

                                                            log(c.rutaTerpilih
                                                                .namaArt!
                                                                .toString());
                                                          },
                                                          child: const Text(
                                                              "Tambah"))
                                                    ],
                                                  );
                                                }));
                                          },
                                          child: const Text("Atur")),
                                    ],
                                  ),
                                ),
                                const SliverToBoxAdapter(
                                    child: SizedBox(height: 10)),
                                SliverFixedExtentList(
                                    itemExtent: 55,
                                    delegate: SliverChildBuilderDelegate(
                                        (_, i) {
                                      var e = c.daftarPertanyaanRuta;
                                      return askSwitch(e[i], c);
                                    },
                                        childCount:
                                            c.daftarPertanyaanRuta.length)),
                                SliverToBoxAdapter(
                                    child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.greenAccent)),
                                      onPressed: () {
                                        c.simpanArt();
                                        c.update();
                                        log(c.rutaTerpilih.namaArt!.length
                                            .toString());
                                      },
                                      child: const Text("Simpan")),
                                )),
                              ],
                            ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            CustomScrollView(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              slivers: [
                                SliverFixedExtentList(
                                    itemExtent: 90,
                                    delegate: SliverChildBuilderDelegate(
                                        (_, i) {
                                      var data = c.filterlistkomoditi[i];
                                      var nilai = c.konsumsiTerpilih
                                          .where((element) =>
                                              element.komoditi == data.no)
                                          .map((e) =>
                                              int.tryParse(e.nilai ?? "0") ?? 0)
                                          .sum;
                                      var form = NumberFormat("#,##0", "id_ID");
                                      return GestureDetector(
                                        onTap: () async {
                                          c.inputKomoditi(i);
                                          c.komoditiHalamaanCtrl =
                                              PageController(initialPage: i);
                                          Get.to(() => const KonsumsiScreen());
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 10),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: (nilai > 0)
                                                    ? Colors.lightGreenAccent
                                                    : Warna.card,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    spreadRadius: .2,
                                                    blurRadius: 5,
                                                    offset: const Offset(0, 5),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ListTile(
                                                    leading: (data.foto == "")
                                                        ? Image.asset(
                                                            ImageRaster.noPhoto,
                                                            height: 150)
                                                        : Image.asset(
                                                            "assets/images/susenas/${data.foto!}",
                                                            width: 70,
                                                          ),
                                                    title: Text(
                                                      data.rincian!,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    subtitle: Text(
                                                      "Rp ${form.format(nilai)}",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                  // _typeIcons(fileType),
                                                ],
                                              ),
                                            )),
                                      );
                                    },
                                        childCount:
                                            c.filterlistkomoditi.length)),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: FloatingActionButton.extended(
                                  onPressed: () {
                                    c.kirim();
                                  },
                                  icon: Icon(Icons.send),
                                  label: Text("Kirim"),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            CustomScrollView(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              slivers: [
                                SliverFixedExtentList(
                                    itemExtent: 90,
                                    delegate: SliverChildBuilderDelegate(
                                        (_, i) {
                                      var data =
                                          c.filterlistkomoditiNonMakan[i];
                                      var nilai = c.konsumsiTerpilih
                                          .where((element) =>
                                              element.komoditi == data.no)
                                          .map((e) =>
                                              int.tryParse(e.nilai ?? "0") ?? 0)
                                          .sum;
                                      var form = NumberFormat("#,##0", "id_ID");
                                      return GestureDetector(
                                        onTap: () async {
                                          c.inputKomoditiNon(i);
                                          c.komoditiHalamaanCtrl =
                                              PageController(initialPage: i);
                                          Get.to(
                                              () => const KonsumsiNonScreen());
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 10),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: (nilai > 0)
                                                    ? Colors.lightGreenAccent
                                                    : Warna.card,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    spreadRadius: .2,
                                                    blurRadius: 5,
                                                    offset: const Offset(0, 5),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ListTile(
                                                    leading: (data.foto == "")
                                                        ? Image.asset(
                                                            ImageRaster.noPhoto,
                                                            height: 150)
                                                        : Image.asset(
                                                            "assets/images/susenas/${data.foto!}",
                                                            width: 70,
                                                          ),
                                                    title: Text(
                                                      data.rincian!,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    subtitle: Text(
                                                      "Rp ${form.format(nilai)}",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                  // _typeIcons(fileType),
                                                ],
                                              ),
                                            )),
                                      );
                                    },
                                        childCount: c.filterlistkomoditiNonMakan
                                            .length)),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: FloatingActionButton.extended(
                                  onPressed: () {
                                    // c.kirim();
                                  },
                                  icon: Icon(Icons.send),
                                  label: Text("Kirim"),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        child: const Text("Cocok")),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget askSwitch(Pertanyaan tanya, KonsumsiController c) {
    // c.rutaTerpilih.=;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: (c.rutaTerpilihMap["${tanya.id}"]) ? Colors.amber : null,
      ),
      padding: EdgeInsets.only(right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tanya.pertanyaan!,
                  style: TeksStyle.judulTanya,
                  maxLines: 2,
                ),
                Text(
                  (tanya.ketPertanyaan == "") ? "" : "(${tanya.ketPertanyaan})",
                  style: TeksStyle.subjudulTanya,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Switch(
                value: (c.rutaTerpilihMap.isEmpty)
                    ? false
                    : c.rutaTerpilihMap["${tanya.id}"],
                onChanged: (value) {
                  c.rutaTerpilihMap["${tanya.id}"] =
                      !c.rutaTerpilihMap["${tanya.id}"];
                  c.onUpdate(tanya.id!, value);
                  c.update();
                }),
          ),
        ],
      ),
    );
  }
}
