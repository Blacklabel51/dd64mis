part of kode;

class _Tabbar extends StatelessWidget {
  const _Tabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KodeController>(
        // autoRemove: false,
        builder: (c) {
      return Container(
        width: Get.width,
        padding: EdgeInsets.only(
            top: 20, left: Get.width * .03, right: Get.width * .05),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverFixedExtentList(
                    itemExtent: 90,
                    delegate: SliverChildBuilderDelegate((_, i) {
                      var data = c.filterlistKode[i];
                      return GestureDetector(
                        onTap: () async {
                          Get.defaultDialog(
                            title: (data.pekerjaan!),
                            content: Container(
                                // height: 100,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                                child: Center(
                                    child: Column(
                                  children: [
                                    (data.kbli == "")
                                        ? const SizedBox()
                                        : Row(
                                            children: [
                                              const Expanded(
                                                flex: 20,
                                                child: Text("KBLI :"),
                                              ),
                                              const Spacer(flex: 1),
                                              Expanded(
                                                flex: 7,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: Colors.greenAccent,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Text(data.kbli!),
                                                ),
                                              )
                                            ],
                                          ),
                                    (data.kbji == "")
                                        ? const SizedBox()
                                        : Row(
                                            children: [
                                              const Expanded(
                                                flex: 20,
                                                child: Text("KBJI :"),
                                              ),
                                              const Spacer(flex: 1),
                                              Expanded(
                                                flex: 7,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: Colors.lightGreen,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Text(data.kbji!),
                                                ),
                                              )
                                            ],
                                          ),
                                    const SizedBox(height: 10),
                                    (data.contoh != "")
                                        ? Column(
                                            children: [
                                              const Text("Keterangan:"),
                                              Text(data.contoh!,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w300))
                                            ],
                                          )
                                        : const SizedBox(),
                                    (data.catatan != "")
                                        ? Column(
                                            children: [
                                              const Text("Catatan:"),
                                              Text(data.catatan!,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w300))
                                            ],
                                          )
                                        : const SizedBox(),
                                    (data.pertanyaan != "")
                                        ? Column(
                                            children: [
                                              const Text("Pertanyaan:"),
                                              Text(data.pertanyaan!,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w300))
                                            ],
                                          )
                                        : const SizedBox(),
                                    (data.tanggapan != "")
                                        ? Column(
                                            children: [
                                              const Text("Tanggapan:"),
                                              Text(data.tanggapan!,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w300))
                                            ],
                                          )
                                        : const SizedBox(),
                                  ],
                                ))),
                            confirm: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(120, 50),
                                    primary: const Color(0xff3e786f)),
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("OK",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700))),
                          );
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: Container(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ListTile(
                                    leading: (data.status == 'tanya')
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.redAccent,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(8))),
                                            child: const Center(
                                                child: Text("Tanya")),
                                          )
                                        : Column(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                height: 20,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.greenAccent,
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(8),
                                                    )),
                                                child: Text(
                                                    "KBLI : ${data.kbli!}"),
                                              ),
                                              Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  height: 20,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black),
                                                      color: Colors.lightGreen,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomLeft:
                                                            Radius.circular(8),
                                                        bottomRight:
                                                            Radius.circular(8),
                                                      )),
                                                  child: Text(
                                                      "KBJI : ${data.kbji!}")),
                                            ],
                                          ),
                                    title: Text(
                                      (data.status == 'tanya')
                                          ? data.pertanyaan!
                                          : data.pekerjaan!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                      (data.status == 'tanya')
                                          ? data.tanggapan!
                                          : "${data.contoh}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                  // _typeIcons(fileType),
                                ],
                              ),
                            )),
                      );
                    }, childCount: c.filterlistKode.length))
              ],
            )),
      );
    });
  }
}
