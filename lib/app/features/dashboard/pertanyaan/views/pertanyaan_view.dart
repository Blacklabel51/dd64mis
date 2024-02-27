import 'dart:math';

import 'package:dd64mis/app/constans/app_constants.dart';
import 'package:dd64mis/app/features/dashboard/cloud/views/screens/cloud_screen.dart';
import 'package:dd64mis/app/features/dashboard/pertanyaan/models/data_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/pertanyaan_controller.dart';
import 'listpertanyaan_view.dart';

class PertanyaanView extends GetView<PertanyaanController> {
  const PertanyaanView({required this.inputData, Key? key}) : super(key: key);

  final Map<String, dynamic> inputData;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(PertanyaanController());
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    print(Pertanyaan.pilihid(c.daftarPertanyaan));
    return Scaffold(
        backgroundColor: const Color(0xfff6f1eb),
        body: SafeArea(
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                slivers: [
              SliverList(
                  delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(children: [
                      GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(Icons.arrow_back_ios,
                              color: Color(0xff575171))),
                      const SizedBox(width: 10),
                      Center(
                          child: Text("${inputData["namaRuta"]}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20)))
                    ]),
                  ),
                  Form(
                    key: _formKey,
                    child: ListpertanyaanView(
                      jawaban: inputData,
                      daftarPertanyaan: c.daftarPertanyaan,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: GetBuilder<PertanyaanController>(
                          builder: (controller) {
                        return FilledButton(
                            onPressed: c.mapContainsValues(inputData)
                                ? () {
                                    c.updateSampel(inputData["no"]!);
                                    Get.defaultDialog(
                                      content: Align(
                                          child: SizedBox(
                                              height: 240,
                                              child: Lottie.asset(
                                                  'assets/animasi/success.json'))),
                                      title: "Input Data",
                                      confirm: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xff3e786f))),
                                          onPressed: () {
                                            Get.back(closeOverlays: true);
                                          },
                                          child: const Text("Siap")),
                                    );
                                  }
                                : null,
                            child: const Text("Save"));
                      }))
                ],
              ))
            ])));
  }
}
