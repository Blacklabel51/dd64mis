part of cloud;

class _Tabbar extends StatelessWidget {
  const _Tabbar({required this.dataMap, Key? key}) : super(key: key);
  final List<Map<String, dynamic>> dataMap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CloudController>(
        autoRemove: false,
        builder: (c) {
          return Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .03,
                right: MediaQuery.of(context).size.width * .05),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )),
            child: DefaultTabController(
                length: 3,
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
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
                      padding: EdgeInsets.all(5),
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      labelStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      tabs: const [
                        Tab(text: "Pemutakhiran"),
                        Tab(text: "Pendataan"),
                        Tab(text: "Miskin"),
                        // Tab(text: "Fenomena"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      CardPemutakhiran(
                          dataSampelan: dataMap,
                          folderData: c.dataSampel
                              .where((e) => e.ruta == "1")
                              .toList()),
                      _CardData(
                          dataSampelan: dataMap, folderData: c.dataSampel),
                      _CardMiskin(
                          folderData: c.dataSampel
                              .where((e) =>
                                  e.miskin == "Miskin" || e.sMiskin == "Miskin")
                              .toList(),
                          dataSampelan: dataMap),
                      // _Tabfenomena(
                      //     dataMap: c.dataFenomena
                      //         .where((element) =>
                      //             element.petugas == c.petugasTerpilih.nama &&
                      //             element.delete != '1')
                      //         .toList())
                    ]),
                  )
                ])),
          );
        });
  }
}
