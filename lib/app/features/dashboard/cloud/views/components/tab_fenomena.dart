part of cloud;

class _Tabfenomena extends StatelessWidget {
  const _Tabfenomena({required this.dataMap, Key? key}) : super(key: key);
  final List<Fenomena> dataMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: GetBuilder<CloudController>(
          autoRemove: false,
          init: CloudController(),
          builder: (c) => SmartRefresher(
              controller: c.refreshControllerFenomena,
              onRefresh: c.refreshDatafenomena,
              child: Stack(
                children: [
                  CustomScrollView(
                      cacheExtent: 500,
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverList(
                            delegate: SliverChildListDelegate((dataMap)
                                .map((data) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 10),
                                      child: GestureDetector(
                                        onTap: () async {
                                          Get.to(() => PertanyaanViewFenomena(
                                              dataMap: data));
                                        },
                                        onLongPress: (() {
                                          Get.defaultDialog(
                                            title: 'Perhatian',
                                            middleText:
                                                'Yakin mau hapus fenomena?',
                                            onCancel: () {
                                              Get.back();
                                            },
                                            onConfirm: () {
                                              c.deletefenomena(data.no!);
                                              Get.back();
                                              c.getFenomena();
                                            },
                                          );
                                        }),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xffFEF5ED),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: .2,
                                                blurRadius: 5,
                                                offset: Offset(0, 5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  "${data.fenomena}",
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.all(0),
                                              ),
                                              // _typeIcons(fileType),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList()))
                      ]),
                  Positioned(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: FloatingActionButton(
                          backgroundColor: const Color(0xff03dac6),
                          foregroundColor: Colors.black,
                          onPressed: () {
                            Get.to(() => PertanyaanViewFenomena(
                                dataMap: Fenomena.kosong()));
                          },
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
