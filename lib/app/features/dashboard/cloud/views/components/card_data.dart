part of cloud;

class _CardData extends StatelessWidget {
  const _CardData(
      {required this.folderData, required this.dataSampelan, Key? key})
      : super(key: key);

  final List<Map<String, dynamic>> dataSampelan;
  final List<Sampel> folderData;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CloudController(), permanent: true);
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: (controller.petugasTerpilih.status == "SUPERVISOR")
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
                    child: Center(
                        child: Column(
                      children: [
                        Text("Data terlalu banyak untuk Supervisor"),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10)),
                              ),
                              onPressed: () => _tempPencacahan(folderData),
                              child: const Text('Export Temp Pencacahan',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10)),
                              ),
                              onPressed: () => _tempPemeriksaan(folderData),
                              child: const Text('Export Temp Pemeriksaan',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ))),
              )
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                slivers: [
                  SliverFixedExtentList(
                      itemExtent: 100,
                      delegate: SliverChildBuilderDelegate((_, i) {
                        var data = folderData[i];
                        return GestureDetector(
                          onTap: () async {
                            var dataini = dataSampelan.firstWhere(
                                (element) => element["no"] == data.no!);
                            log('Data jawaban disini');
                            log(dataini.toString());
                            Get.to(() => PertanyaanView(inputData: dataini));
                          },
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: (data.sPencacahan! == "Sudah")
                                      ? Colors.green.shade200
                                      : const Color(0xffFEF5ED),
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
                                      // leading: const Icon(
                                      //     Icons.info_outline_rounded,
                                      //     color: Colors.greenAccent),
                                      title: Text(
                                        "${data.namaRuta}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TeksStyle.judul,
                                      ),
                                      subtitle: Text(
                                          (controller.petugasTerpilih.status ==
                                                  "PML")
                                              ? "${data.desa}, ${data.sls!.replaceAll(RegExp(r'\[([0-9]+)\]\ '), '')}, ${data.bs!} [${data.nks!}]\nPCL : ${data.kodePcl!}"
                                              : "${data.desa}, ${data.sls!.replaceAll(RegExp(r'\[([0-9]+)\]\ '), '')}, ${data.bs!} [${data.nks!}]",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TeksStyle.keterangan),
                                      trailing: (data.sPemeriksaan! == "Sudah")
                                          ? const Icon(
                                              Icons.playlist_add_check_rounded,
                                              color: Colors.redAccent,
                                            )
                                          : null,
                                    ),
                                  ],
                                ),
                              )),
                        );
                      }, childCount: folderData.length))
                ],
              ));
  }

  Future<void> _tempPencacahan(List<Sampel> data) async {
    //Create a Excel document.

    //Creating a workbook.
    final sync.Workbook workbook = sync.Workbook(0);
    //Adding a Sheet with name to workbook.
    final sync.Worksheet sheet = workbook.worksheets.addWithName('data');

    //Load data
    sheet
        .getRangeByName('A1:i1')
        .setText('Data Progress Pemutakhiran Rumah Tangga');
    sheet.getRangeByName('A1:i1').merge();

    sheet.getRangeByName('A2').setText('kode prop [2 digit]');
    sheet.getRangeByName('B2').setText('kode kab [2 digit]');
    sheet.getRangeByName('C2').setText('kode NKS  [6 digit]');
    sheet.getRangeByName('D2').setText('No Urut Ruta  [max: 2 digit]');
    sheet.getRangeByName('E2').setText('Sudah Selesai? [sudah / belum]');
    sheet.getRangeByName('F2').setText('Jumlah Anggota Rumah Tangga (ART)');
    sheet.getRangeByName('G2').setText(
        'Jumlah ART umur 10 tahun ke atas yang melakukan kegiatan untuk menenangkan hati/ pikiran?');
    sheet.getRangeByName('H2').setText('Jumlah komoditas makanan');
    sheet.getRangeByName('I2').setText('Jumlah Komoditas Non Makanan');

    sheet.importList(
        data.map((element) => element.kabkota!.substring(0, 2)).toList(),
        3,
        1,
        true);
    sheet.importList(
        data.map((element) => element.kabkota!.substring(2, 4)).toList(),
        3,
        2,
        true);
    sheet.importList(data.map((element) => element.nks).toList(), 3, 3, true);
    sheet.importList(data.map((element) => element.ruta).toList(), 3, 4, true);
    sheet.importList(
        data.map((element) => element.sPencacahan).toList(), 3, 5, true);
    sheet.importList(data.map((element) => element.art).toList(), 3, 6, true);
    sheet.importList(
        data.map((element) => element.namaRuta).toList(), 3, 7, true);
    sheet.importList(
        data.map((element) => element.komoditasMakan).toList(), 3, 8, true);
    sheet.importList(
        data.map((element) => element.komoditasNonmakan).toList(), 3, 9, true);

    ///Create a table with the data in a range
    // final sync.ExcelTable table =
    //     sheet.tableCollection.create('Table1', sheet.getRangeByName('A1:E25'));

    final List<int> bytes = workbook.saveAsStream();

    await createFolderInAppDocDir('DD64MIS').then((value) {
      var fileName = 'template_cacah.xls';
      File(join('$value/$fileName')).writeAsBytes(bytes);
    });

    workbook.dispose();

    //Launch file.
    // await FileSaveHelper.saveAndLaunchFile(bytes, 'Table.xlsx');
  }

  Future<void> _tempPemeriksaan(List<Sampel> data) async {
    //Create a Excel document.

    //Creating a workbook.
    final sync.Workbook workbook = sync.Workbook(0);
    //Adding a Sheet with name to workbook.
    final sync.Worksheet sheet = workbook.worksheets.addWithName('data');

    //Load data
    sheet
        .getRangeByName('A1:E1')
        .setText('Data Progress Pemeriksaan Kuesioner Susenas');
    sheet.getRangeByName('A1:E1').merge();

    sheet.getRangeByName('A2').setText('kode prop [2 digit]');
    sheet.getRangeByName('B2').setText('kode kab [2 digit]');
    sheet.getRangeByName('C2').setText('kode NKS  [6 digit]');
    sheet.getRangeByName('D2').setText('No Urut Ruta  [max: 2 digit]');
    sheet.getRangeByName('E2').setText('Sudah Selesai? [sudah / belum]');

    sheet.importList(
        data.map((element) => element.kabkota!.substring(0, 2)).toList(),
        3,
        1,
        true);
    sheet.importList(
        data.map((element) => element.kabkota!.substring(2, 4)).toList(),
        3,
        2,
        true);
    sheet.importList(data.map((element) => element.nks).toList(), 3, 3, true);
    sheet.importList(data.map((element) => element.ruta).toList(), 3, 4, true);
    sheet.importList(
        data.map((element) => element.sPemeriksaan!.toLowerCase()).toList(),
        3,
        5,
        true);

    ///Create a table with the data in a range
    // final sync.ExcelTable table =
    //     sheet.tableCollection.create('Table1', sheet.getRangeByName('A1:E25'));

    // ///Formatting table with a built-in style
    // table.builtInTableStyle = sync.ExcelTableBuiltInStyle.tableStyleMedium9;

    // table.showTotalRow = true;
    // table.showFirstColumn = true;
    // table.showBandedColumns = true;
    // table.showBandedRows = true;
    // table.columns[0].totalRowLabel = 'Total';
    // table.columns[1].totalFormula = sync.ExcelTableTotalFormula.sum;
    // table.columns[2].totalFormula = sync.ExcelTableTotalFormula.sum;
    // table.columns[3].totalFormula = sync.ExcelTableTotalFormula.sum;
    // table.columns[4].totalFormula = sync.ExcelTableTotalFormula.sum;

    // final sync.Range range = sheet.getRangeByName('B2:E26');
    // range.numberFormat = r'_($* #,##0.00_)';

//creat

    // sheet.getRangeByIndex(1, 1, 1, 7).autoFitColumns();
    // //Freezepane
    // sheet.getRangeByName('A2').freezePanes();

    //Save and dispose Workbook
    final List<int> bytes = workbook.saveAsStream();

    await createFolderInAppDocDir('DD64MIS').then((value) {
      var fileName = 'template_periksa.xls';
      File(join('$value/$fileName')).writeAsBytes(bytes);
    });

    workbook.dispose();

    //Launch file.
    // await FileSaveHelper.saveAndLaunchFile(bytes, 'Table.xlsx');
  }
}
