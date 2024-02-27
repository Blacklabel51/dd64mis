part of cloud;

class CardPemutakhiran extends StatelessWidget {
  CardPemutakhiran(
      {required this.folderData, required this.dataSampelan, Key? key})
      : super(key: key);

  final List<Updating> folderData;
  final List<Map<String, dynamic>> dataSampelan;
  final GlobalKey<FormState> _formkeyPemutakhiran = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var pendataan = {"1": "Sudah", "0": "Belum"};
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
                        const Text("Data terlalu banyak untuk Supervisor"),
                        const SizedBox(height: 30),
                        SizedBox(
                          // height: 20,
                          child: Align(
                              // alignment: Alignment.topLeft,
                              child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10)),
                            ),
                            onPressed: () => _tempMutakhir(folderData),
                            child: const Text('Export Temp Pemutakhiran',
                                style: TextStyle(color: Colors.white)),
                          )),
                        ),
                      ],
                    ))),
              )
            : SingleChildScrollView(
                child: Column(
                    children: (folderData)
                        .map(
                          (data) => GestureDetector(
                            onTap: () {
                              controller.nilailah(data.sPemutakhiran!);
                              controller.values = {};
                              Get.defaultDialog(
                                  title: "",
                                  content: SingleChildScrollView(
                                    child: GetBuilder<CloudController>(
                                        builder: (c) {
                                      var lihat = '';
                                      return Column(
                                        children: [
                                          const Text("Status Pemutakhiran",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.w700)),
                                          const SizedBox(height: 15),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: pendataan.entries
                                                    .map((e) => SelectableBox(
                                                            e.value,
                                                            width: 100,
                                                            isSelected: c
                                                                    .nilai ==
                                                                e.value,
                                                            onTap: () {
                                                          c.nilailah(e.value);
                                                          c.onUpdate(
                                                              "sPemutakhiran",
                                                              e.value);
                                                        }))
                                                    .toList()),
                                          ),
                                          Visibility(
                                              visible: (c.nilai == "Sudah")
                                                  ? true
                                                  : false,
                                              child: Form(
                                                key: _formkeyPemutakhiran,
                                                child: Column(
                                                  children: [
                                                    const SizedBox(height: 10),
                                                    Row(children: [
                                                      const Expanded(
                                                          flex: 7,
                                                          child: Text(
                                                              "Jumlah Keluarga Awal",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black45,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700))),
                                                      Expanded(
                                                          flex: 3,
                                                          child: TextFormField(
                                                            autofocus: true,
                                                            initialValue: data
                                                                .keluargaAwal,
                                                            decoration:
                                                                InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10.0,
                                                                      horizontal:
                                                                          10.0),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            onChanged: (value) {
                                                              controller.onUpdate(
                                                                  "keluargaAwal",
                                                                  value);
                                                            },
                                                            validator: (value) {
                                                              if (value!
                                                                      .isEmpty ||
                                                                  value == '') {
                                                                return 'Wajib diisi bosku';
                                                              }
                                                              return null;
                                                            },
                                                          ))
                                                    ]),
                                                    const SizedBox(height: 10),
                                                    Row(children: [
                                                      const Expanded(
                                                          flex: 7,
                                                          child: Text(
                                                              "Jumlah Keluarga hasil updating",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black45,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700))),
                                                      Expanded(
                                                          flex: 3,
                                                          child: TextFormField(
                                                            initialValue: data
                                                                .keluargaUpdate,
                                                            decoration:
                                                                InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10.0,
                                                                      horizontal:
                                                                          10.0),
                                                            ),
                                                            // onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: (value) {
                                                              if (value!
                                                                      .isEmpty ||
                                                                  value == '') {
                                                                return 'Wajib diisi bosku';
                                                              }
                                                              return null;
                                                            },
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            onChanged: (value) {
                                                              lihat = value;
                                                              controller.onUpdate(
                                                                  "keluargaUpdate",
                                                                  value);
                                                            },
                                                          ))
                                                    ]),
                                                    const SizedBox(height: 10),
                                                    Row(children: [
                                                      const Expanded(
                                                          flex: 7,
                                                          child: Text(
                                                              "Jumlah Ruta hasil updating",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black45,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700))),
                                                      Expanded(
                                                          flex: 3,
                                                          child: TextFormField(
                                                            initialValue:
                                                                data.rutaUpdate,
                                                            decoration:
                                                                InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10.0,
                                                                      horizontal:
                                                                          10.0),
                                                            ),
                                                            // onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                                                            // autovalidateMode:
                                                            //     AutovalidateMode.always,
                                                            validator: (value) {
                                                              if (value!
                                                                      .isEmpty ||
                                                                  value == '') {
                                                                return 'Wajib diisi bosku';
                                                              }
                                                              return null;
                                                            },
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            onChanged: (value) {
                                                              controller.onUpdate(
                                                                  "rutaUpdate",
                                                                  value);
                                                            },
                                                          ))
                                                    ])
                                                  ],
                                                ),
                                              ))
                                        ],
                                      );
                                    }),
                                  ),
                                  confirm: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(120, 50),
                                          primary: const Color(0xff3e786f)),
                                      onPressed: () {
                                        try {
                                          if (!_formkeyPemutakhiran
                                              .currentState!
                                              .validate()) {
                                            return;
                                          }
                                        } catch (e) {
                                          log("tidak ada form validasi");
                                        }
                                        try {
                                          controller
                                              .updatePemutakhiran(
                                                  data.no!, controller.values)
                                              .then((value) {
                                            controller.getUpdating();
                                            Get.back(closeOverlays: true);
                                            Get.snackbar(
                                              "Status Pengiriman",
                                              "Berhasil",
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor: Colors.green,
                                            );
                                          });
                                        } catch (e) {
                                          Get.snackbar("Perhatian",
                                              "Gagal Kirim karena $e",
                                              backgroundColor:
                                                  Colors.orangeAccent);
                                        }
                                      },
                                      child: const Text("Simpan",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700))));
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
                                  color: (data.sPemutakhiran != "Sudah")
                                      ? const Color(0xffFEF5ED)
                                      : Colors.green.shade200,
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
                                      leading: (data.seruti == "Y")
                                          ? const Icon(Icons.whatshot_rounded,
                                              color: Colors.redAccent)
                                          : null,
                                      title: Text(
                                        "${data.desa}, ${data.sls!.replaceAll(RegExp(r'\[([0-9]+)\]'), '')} ",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        "${data.bs} - ${data.nks}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
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

  Future<void> _tempMutakhir(List<Updating> data) async {
    //Create a Excel document.

    //Creating a workbook.
    final sync.Workbook workbook = sync.Workbook(0);
    //Adding a Sheet with name to workbook.
    final sync.Worksheet sheet = workbook.worksheets.addWithName('data');

    //Load data
    sheet
        .getRangeByName('A1')
        .setText('Data Progress Pemutakhiran Rumah Tangga');
    sheet.getRangeByName('A1:G1').merge();

    sheet.getRangeByName('A2').setText('kode prop [2 digit]');
    sheet.getRangeByName('B2').setText('kode kab [2 digit]');
    sheet.getRangeByName('C2').setText('kode NKS  [6 digit]');
    sheet.getRangeByName('D2').setText('Sudah Selesai 1 BS? [sudah/belum]');
    sheet.getRangeByName('E2').setText('Jumlah Keluarga Sebelum Pemutakhiran');
    sheet.getRangeByName('F2').setText('Jumlah Keluarga Hasil Pemutakhiran');
    sheet
        .getRangeByName('G2')
        .setText('Jumlah Rumah Tangga Hasil Pemutakhiran');

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
    sheet.importList(
        data.map((element) => element.sPemutakhiran!.toLowerCase()).toList(),
        3,
        4,
        true);
    sheet.importList(
        data.map((element) => element.keluargaAwal).toList(), 3, 5, true);
    sheet.importList(
        data.map((element) => element.keluargaUpdate).toList(), 3, 6, true);
    sheet.importList(
        data.map((element) => element.rutaUpdate).toList(), 3, 7, true);

    ///Create a table with the data in a range
    // final sync.ExcelTable table = sheet.tableCollection
    //     .create('Table1', sheet.getRangeByIndex(1, 1, data.length + 1, 7));

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

    sheet.getRangeByIndex(1, 1, 1, 7).autoFitColumns();
    // //Freezepane
    // sheet.getRangeByName('A2').freezePanes();

    //Save and dispose Workbook
    final List<int> bytes = workbook.saveAsStream();

    await createFolderInAppDocDir('DD64MIS').then((value) {
      var fileName = 'template_mutakhir.xlsx';
      File(join('$value/$fileName')).writeAsBytes(bytes);
    });

    workbook.dispose();

    //Launch file.
    // await FileSaveHelper.saveAndLaunchFile(bytes, 'Table.xlsx');
  }
}
