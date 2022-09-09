part of cloud;

class _CardMiskin extends StatelessWidget {
  _CardMiskin({required this.folderData, required this.dataSampelan, Key? key})
      : super(key: key);

  final List<Sampel> folderData;
  final List<Map<String, dynamic>> dataSampelan;
  String pengeluaran = "";
  bool kosong = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
            child: (folderData.isEmpty)
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Container(
                        height: 100,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                        child: const Center(
                            child: Text("Tidak ada data rumah tangga miskin"))),
                  )
                : Column(
                    children: (folderData)
                        .map(
                          (data) => GestureDetector(
                            onTap: () async {
                              var dataini = dataSampelan.firstWhere(
                                  (element) => element["no"] == data.no!);
                              try {
                                pengeluaran = NumberFormat.decimalPattern()
                                    .format(
                                        ((int.parse(dataini['totalKeluar']) /
                                                int.parse(dataini['art']))
                                            .round()));
                                print(pengeluaran);
                                kosong = false;
                              } catch (e) {
                                kosong = true;
                                print(e);
                              }
                              Get.defaultDialog(
                                title: ("Deteksi Dini Kemiskinan :"),
                                content: Container(
                                    // height: 100,
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 0),
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
                                        Row(
                                          children: [
                                            const Expanded(
                                              flex: 20,
                                              child: Text(
                                                  "Status Menurut Pengamatan Pencacah :"),
                                            ),
                                            const Spacer(flex: 1),
                                            Expanded(
                                              flex: 7,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: (dataini["miskin"] ==
                                                          'Miskin')
                                                      ? Colors.amberAccent
                                                      : Colors.greenAccent,
                                                ),
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Text(dataini["miskin"]),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        (kosong)
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                color: Colors.redAccent,
                                                child: const Text(
                                                    "Input data Pengeluaran Terlebih dahulu",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              )
                                            : Row(
                                                children: [
                                                  const Expanded(
                                                    flex: 20,
                                                    child: Text(
                                                        "Status Menurut Pengeluaran ruta:"),
                                                  ),
                                                  const Spacer(flex: 1),
                                                  Expanded(
                                                    flex: 7,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                        color: (dataini[
                                                                    "sMiskin"] ==
                                                                'Miskin')
                                                            ? Colors.amberAccent
                                                            : Colors
                                                                .greenAccent,
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: Text(
                                                          dataini["sMiskin"]),
                                                    ),
                                                  )
                                                ],
                                              ),
                                        const SizedBox(height: 20),
                                        const Text("Keterangan:"),
                                        Text(
                                            "1. Nilai pengeluaran per kapita per bulan: Rp.$pengeluaran. Jumlah komoditas makanan: ${dataini['komoditasMakan']}. Jumlah komoditas bukan makanan: ${dataini['komoditasNonmakan']}.\n Cek kembali dokumen, kelengkapan (komoditas yang terisi) dan kewajaran isian dst.\n2. Lakukan revisit ke rumah tangga jika diperlukan\n3. Tambahkan catatan di Blok Catatan terkait kondisi rumah tangga jika seluruh isian sudah sesuai",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w300)),
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
                                // height: 112,
                                // width: width ?? 200,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                      title: Text(
                                        data.namaRuta!.capitalizeFirst!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        "NKS : ${data.nks},  PCL : ${data.kodePcl!}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      contentPadding: const EdgeInsets.all(0),
                                    ),
                                    // _typeIcons(fileType),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList())));
  }
}
