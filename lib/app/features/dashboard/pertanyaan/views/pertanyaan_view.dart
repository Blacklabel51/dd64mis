import 'package:mysusenas/app/features/dashboard/cloud/views/screens/cloud_screen.dart';
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
    return Scaffold(
        backgroundColor: Color(0xfff6f1eb),
        body: SafeArea(
            child: CustomScrollView(
                physics: BouncingScrollPhysics(),
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
                          child: Icon(Icons.arrow_back_ios,
                              color: Color(0xff575171))),
                      SizedBox(width: 10),
                      Center(
                          child: Text("${inputData["namaRuta"]}",
                              style: TextStyle(
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
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff3e786f))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print("valid");
                            }
                            c.updateSampel(inputData["no"]!);
                            Get.defaultDialog(
                              content:
                                  Lottie.asset('assets/animasi/success.json'),
                              title: "Input Data",
                              confirm: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xff3e786f))),
                                  onPressed: () {
                                    Get.back(closeOverlays: true);
                                  },
                                  child: Text("Siap")),
                            );
                          },
                          child: Text("Save")))
                ],
              ))
            ])));
  }
}
