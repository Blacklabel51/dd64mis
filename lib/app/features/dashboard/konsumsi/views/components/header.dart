part of konsumsi;

class _Header extends StatelessWidget {
  _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KonsumsiController>(
        // initState: (state) {
        //   txtController = TextEditingController();
        // },
        // autoRemove: false,
        builder: (controller) => Stack(
              alignment: Alignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
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
                        child: _title((controller.rutaTerpilih.namaRuta == null)
                            ? "No Name"
                            : controller.rutaTerpilih.namaRuta!))),
                SearchBarAnimation(
                    // hintText: "Cari Disini",
                    enableKeyboardFocus: true,
                    durationInMilliSeconds: 500,
                    textEditingController: controller.cariMakanan,
                    isOriginalAnimation: false,
                    buttonBorderColour: Colors.black45,
                    buttonIcon: Icons.search,
                    onChanged: (text) {
                      controller.search(text);
                    },
                    onCollapseComplete: () {
                      print("close ini");
                      controller.cariMakanan.clear();
                      controller.search('');
                    },
                    isSearchBoxOnRightSide: true),
              ],
            ));
  }

  Widget _title(String data) {
    return Row(
      children: [
        Icon(Icons.arrow_drop_down_circle_outlined),
        Text(
          data,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
