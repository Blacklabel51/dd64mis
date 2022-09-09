part of konsumsi;

class _CardData extends StatelessWidget {
  const _CardData({required this.datakonsumsi, Key? key}) : super(key: key);

  final List<Konsumsi> datakonsumsi;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverFixedExtentList(
                itemExtent: 90,
                delegate: SliverChildBuilderDelegate((_, i) {
                  var data = datakonsumsi[i];
                  return GestureDetector(
                    onTap: () async {},
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFEF5ED),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: .2,
                                blurRadius: 5,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                leading: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      height: 20,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                          )),
                                      child: Text("KBLI : ${data.banyak!}"),
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        height: 20,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8),
                                            )),
                                        child: Text("KBJI : ${data.nilai!}")),
                                  ],
                                ),
                                title: Text(
                                  data.banyak!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  "${data.nilai}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                              // _typeIcons(fileType),
                            ],
                          ),
                        )),
                  );
                }, childCount: datakonsumsi.length))
          ],
        ));
  }
}
