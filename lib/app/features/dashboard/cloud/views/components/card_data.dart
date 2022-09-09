part of cloud;

class _CardData extends StatelessWidget {
  const _CardData(
      {required this.folderData, required this.dataSampelan, Key? key})
      : super(key: key);

  final List<Sampel> folderData;
  final List<Map<String, dynamic>> dataSampelan;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CloudController(), permanent: true);
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverFixedExtentList(
                itemExtent: 90,
                delegate: SliverChildBuilderDelegate((_, i) {
                  var data = folderData[i];
                  return GestureDetector(
                    onTap: () async {
                      var dataini = dataSampelan
                          .firstWhere((element) => element["no"] == data.no!);
                      Get.to(() => PertanyaanView(inputData: dataini));
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                  leading: (data.sPencacahan! == "" ||
                                          data.sPencacahan! == "0")
                                      ? const Icon(
                                          Icons.sentiment_neutral_rounded,
                                          color: Colors.grey)
                                      : const Icon(
                                          Icons.sentiment_satisfied_sharp,
                                          color: Colors.greenAccent),
                                  title: Text(
                                    data.namaRuta!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    (controller.petugasTerpilih.status == "PML")
                                        ? "BS : ${data.desa}-${data.bs}\nPCL : ${data.kodePcl} "
                                        : "BS : ${data.desa}-${data.bs}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: (data.sPemeriksaan != "Sudah")
                                      ? const Icon(Icons.cloud_off_sharp,
                                          color: Colors.grey)
                                      : (data.sDokClean != "Sudah")
                                          ? const Icon(Icons.cloud_rounded,
                                              color: Colors.yellow)
                                          : const Icon(Icons.cloud_done_rounded,
                                              color: Colors.greenAccent)),
                              // _typeIcons(fileType),
                            ],
                          ),
                        )),
                  );
                }, childCount: folderData.length))
          ],
        ));
  }
}
