import 'package:flutter/cupertino.dart';
import 'package:dd64mis/app/features/dashboard/pertanyaan/views/components/GetCurrentLocation.dart';
import 'package:dd64mis/app/features/dashboard/pertanyaan/views/components/GetCurrentLocprov.dart';
import 'package:dd64mis/app/features/dashboard/pertanyaan/views/components/GetDate.dart';
import 'package:dd64mis/app/features/dashboard/pertanyaan/views/components/selectable_box.dart';
import 'package:intl/intl.dart';

import '../controllers/pertanyaan_controller.dart';
import 'package:dd64mis/app/features/dashboard/pertanyaan/models/data_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:pattern_formatter/pattern_formatter.dart';

import 'package:get/get.dart';

class ListpertanyaanView extends GetView<PertanyaanController> {
  ListpertanyaanView(
      {required this.daftarPertanyaan, required this.jawaban, Key? key})
      : super(key: key);
  final List<Pertanyaan> daftarPertanyaan;
  final Map<String, dynamic> jawaban;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return GestureDetector(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
                children:
                    daftarPertanyaan.map((e) => _main(e, context)!).toList()),
          )),
    );
  }

  Widget? _main(Pertanyaan pertanyaan, BuildContext context) {
    var tanya = pertanyaan.jenisPertanyaan!;
    switch (tanya) {
      case 'angka':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(children: [
            Expanded(flex: 7, child: Text(pertanyaan.pertanyaan!)),
            Expanded(
                flex: 3,
                child: TextFormField(
                  initialValue: NumberFormat.decimalPattern().format(int.parse(
                      (jawaban[pertanyaan.id!] == "")
                          ? "0"
                          : jawaban[pertanyaan.id!])),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                  ),
                  inputFormatters: [ThousandsFormatter()],
                  // onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                  keyboardType: TextInputType.number,

                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    controller.onUpdate(
                        pertanyaan.id!, value.replaceAll(",", ""));
                  },
                ))
          ]),
        );
      case 'pilihanbanyak':
        var c = json.decode("{ ${pertanyaan.rincian!} }") as Map;
        var result = c.cast<String, String>();
        return Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Text(pertanyaan.pertanyaan!)),
            GetBuilder<PertanyaanController>(
                id: pertanyaan.id,
                initState: (_) {
                  controller.initpilihan(
                      pertanyaan.id!, jawaban[pertanyaan.id]!);
                },
                builder: (controller) => Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: result.entries
                        .map((e) => SelectableBox(e.value,
                                isSelected: controller.nilai == e.key,
                                onTap: () {
                              controller.nilailah(pertanyaan.id!, e.key);
                              controller.onUpdate(pertanyaan.id!, e.key);
                            }))
                        .toList()))
          ],
        );
      case 'koordinat':
        controller.koordinat = jawaban[pertanyaan.id]!;
        controller.ambilderajat(jawaban[pertanyaan.id]!);
        controller.ambilpermisi();
        final _formKey = GlobalKey<FormState>();
        return GetBuilder<PertanyaanController>(
            builder: (c) => GetCurrentProv(
                  onTap: () {
                    c.locationPermission(pertanyaan.id!);
                  },
                  onTapmanual: () {
                    Get.defaultDialog(
                        title: "Koordinat",
                        content: Form(
                          key: _formKey,
                          child: TextFormField(
                            // controller: c.koordinattext,
                            autofocus: true,
                            initialValue: jawaban[pertanyaan.id!],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                            textInputAction: TextInputAction.next,
                            onSaved: (value) {
                              c.onUpdate(pertanyaan.id!, value!);
                              c.koordinat = value;
                            },
                          ),
                        ),
                        confirm: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(120, 50),
                                primary: const Color(0xff3e786f)),
                            onPressed: () {
                              c.onUpdate(pertanyaan.id!, c.koordinattext.text);
                              _formKey.currentState!.save();
                              Get.back();
                            },
                            child: const Text("Simpan",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))),
                        cancel: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(120, 50),
                                primary:
                                    const Color.fromARGB(255, 245, 104, 94)),
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Batal",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))));
                  },
                  isloading: c.isloading,
                  locationData: c.koordinat,
                  koordinatDerjat: c.koordinatDerajat,
                ));
      case 'jam':
        controller.ambiljam(jawaban[pertanyaan.id]!);
        return GetBuilder<PertanyaanController>(
            builder: (controller) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                      gradient: LinearGradient(colors: [
                        Colors.grey,
                        Colors.grey.withOpacity(.5),
                      ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Center(
                            child: Column(
                              children: [
                                const Text('Jam :',
                                    textAlign: TextAlign.center),
                                Container(
                                  height: 120,
                                  child: ListView.builder(
                                    itemCount: controller.listjam.length,
                                    itemBuilder: (context, i) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                              onTap: (() {
                                                controller.hapusjam(i);
                                                controller.onUpdate(
                                                    pertanyaan.id!,
                                                    controller.listjam
                                                        .join(','));
                                                print(controller.listjam);
                                              }),
                                              child: const Icon(
                                                Icons.delete,
                                                color: Color.fromARGB(
                                                    255, 253, 122, 122),
                                              )),
                                          Text(controller.listjam[i]),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffda902a),
                                ),
                                onPressed: () {
                                  controller.tambahjam(DateTime.now());
                                  controller.onUpdate(pertanyaan.id!,
                                      controller.listjam.join(','));
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.alarm_add),
                                    const Text(
                                      'Jam',
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffda902a),
                                ),
                                onPressed: () {
                                  // controller.tambahjam();
                                  // controller.onUpdate(pertanyaan.id!,
                                  //     controller.listjam.join(','));
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (_) => Container(
                                            height: 300,
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 200,
                                                  child: CupertinoDatePicker(
                                                      use24hFormat: true,
                                                      mode:
                                                          CupertinoDatePickerMode
                                                              .dateAndTime,
                                                      initialDateTime:
                                                          DateTime.now(),
                                                      onDateTimeChanged: (val) {
                                                        // controller.tambahhari(
                                                        //     pertanyaan.id!,
                                                        //     val);
                                                        // controller.onUpdate(
                                                        //     pertanyaan.id!,
                                                        //     DateFormat(
                                                        //             'dd-MM-yyyy')
                                                        //         .format(val));

                                                        controller.ubahjam(val);
                                                      }),
                                                ),

                                                // Close the modal
                                                CupertinoButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                      controller.tambahjam(
                                                          controller
                                                                  .waktuchange ??
                                                              DateTime.now());
                                                      controller.onUpdate(
                                                          pertanyaan.id!,
                                                          controller.listjam
                                                              .join(','));
                                                      Get.back();
                                                    })
                                              ],
                                            ),
                                          ));
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.edit),
                                    const Text(
                                      'Manual',
                                    ),
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
      case 'tanggal':
        controller.ambilhari(pertanyaan.id!, jawaban[pertanyaan.id]!);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GetBuilder<PertanyaanController>(
              id: pertanyaan.id,
              builder: (controller) => GetDate(
                    label: pertanyaan.pertanyaan,
                    onTapnow: () {
                      controller.tambahhari(pertanyaan.id!, DateTime.now());
                      controller.onUpdate(pertanyaan.id!, controller.nilaihari);
                    },
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (_) => Container(
                                height: 500,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 400,
                                      child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.date,
                                          maximumYear: 2022,
                                          minimumYear: 2022,
                                          initialDateTime: DateTime.now(),
                                          onDateTimeChanged: (val) {
                                            controller.tambahhari(
                                                pertanyaan.id!, val);
                                            controller.onUpdate(
                                                pertanyaan.id!,
                                                DateFormat('dd-MM-yyyy')
                                                    .format(val));
                                          }),
                                    ),

                                    // Close the modal
                                    CupertinoButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        if (controller.nilaihari == "") {
                                          controller.tambahhari(
                                              pertanyaan.id!, DateTime.now());
                                          controller.onUpdate(
                                              pertanyaan.id!,
                                              DateFormat('dd-MM-yyyy')
                                                  .format(DateTime.now()));
                                        }
                                        Get.back();
                                      },
                                    )
                                  ],
                                ),
                              ));
                    },
                    locationData: controller.nilaihari,
                  )),
        );

      default:
        return const SizedBox();
      // print('It\'s weekend');
    }
  }
}
