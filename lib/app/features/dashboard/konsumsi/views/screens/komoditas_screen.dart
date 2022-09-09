part of konsumsi;

class KomoditasScreen extends StatelessWidget {
  KomoditasScreen({required this.komoditiData, Key? key}) : super(key: key);

  final KomoditiData komoditiData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KonsumsiController>(
        init: KonsumsiController(),
        // autoRemove: false,
        builder: (controller) => Scaffold(
              backgroundColor: Color(0xfff6f1eb),
              body: SafeArea(
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: Get.width * 0.8,
                                  child: Text(
                                    "Konsumsi ${komoditiData.rincian}",
                                    style: TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                                (komoditiData.foto == "")
                                    ? Image.asset(
                                        ImageRaster.noPhoto,
                                      )
                                    : FotoZoom(link: komoditiData.foto!),
                                Text(komoditiData.satuan!)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
