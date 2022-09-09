part of konsumsi;

class KonsumsiNonScreen extends StatelessWidget {
  const KonsumsiNonScreen({Key? key}) : super(key: key);

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
                                c.pindahKomoditiNon(value);
                              },
                              itemBuilder: (context, index) {
                                return KonsumsiNon(index: index);
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
                          heroTag: 'cancel',
                          label: const Text('Batal'),
                          icon: const Icon(Icons.cancel),
                          backgroundColor: Colors.pink,
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
