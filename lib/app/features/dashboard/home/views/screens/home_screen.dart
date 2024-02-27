library home;

import 'dart:io';
// import 'dart:math';
import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dd64mis/app/constans/app_constants.dart';
import 'package:dd64mis/app/features/dashboard/cloud/views/screens/cloud_screen.dart';
import 'package:dd64mis/app/shared_components/card_cloud.dart';
import 'package:dd64mis/app/shared_components/custom_button.dart';
import 'package:dd64mis/app/shared_components/file_list_button.dart';
import 'package:dd64mis/app/shared_components/header_text.dart';
import 'package:dd64mis/app/shared_components/search_button.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:syncfusion_flutter_xlsio/xlsio.dart' as sync;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:permission_handler/permission_handler.dart' as misi;
// import 'package:path/path.dart' show join;

// binding
part '../../bindings/home_binding.dart';

// controller
part '../../controllers/home_controller.dart';

// model
part '../../models/usage.dart';
part '../../models/user.dart';
part '../../models/kabkot.dart';
part '../../models/jadwal.dart';

// component
part '../components/category.dart';
part '../components/header.dart';
part '../components/recent.dart';
part '../components/storage_chart.dart';
part '../components/card_service.dart';
part '../components/grafik.dart';
part '../components/grafikPetugas.dart';
part '../components/save_file.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datapetugas = Get.put(CloudController());
    return Scaffold(
        backgroundColor: Color(0xfff6f1eb),
        body: SafeArea(
          child: GetBuilder<HomeController>(
            init: HomeController(),
            autoRemove: false,
            builder: (controller) => SmartRefresher(
              controller: controller.refreshController,
              header: const ClassicHeader(
                  failedText: "Gagal guys",
                  completeText: "Berhasil",
                  refreshingText: "Sabar ki"),
              onRefresh: () {
                Future(() async {
                  var a = await datapetugas.getPetugas();
                  var b = await controller.getData();
                  var c = await controller.getJadwal();
                  if (a && b && c) {
                    return true;
                  } else {
                    return false;
                  }
                }).then((value) {
                  if (value) {
                    controller.refreshController.refreshCompleted();
                    Get.showSnackbar(const GetSnackBar(
                        message: "Berhasil",
                        backgroundColor: Colors.greenAccent,
                        duration: Duration(seconds: 3)));
                  } else {
                    controller.refreshController.refreshFailed();
                    Get.showSnackbar(GetSnackBar(
                        message: controller.pesanerror,
                        backgroundColor: Colors.orange,
                        duration: const Duration(seconds: 3)));
                  }
                }).timeout(const Duration(seconds: 30), onTimeout: () {
                  controller.refreshController.refreshToIdle();
                  Get.showSnackbar(const GetSnackBar(
                      message: "Refresh ulang ki",
                      backgroundColor: Colors.grey,
                      duration: Duration(seconds: 3)));
                });
              },
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const Padding(
                          padding: EdgeInsets.all(kDefaultSpacing),
                          child: _Header(),
                        ),
                        _CardService(data: controller.dataJadwal),
                        Align(
                            alignment: Alignment.topRight,
                            child: Switch(
                                value: controller.ganti,
                                onChanged: (value) {
                                  controller.ganti = value;
                                  controller.update();
                                })),
                        (datapetugas.petugasTerpilih.nama == null ||
                                datapetugas.petugasTerpilih.nama == '' ||
                                controller.ganti)
                            ? _GrafikPetugas(data: controller.dataKab.toList())
                            : _Grafik(
                                data: datapetugas.dataPetugas
                                    .where((element) =>
                                        element.kabkota ==
                                            datapetugas
                                                .petugasTerpilih.kabkota &&
                                        element.status == 'PCL')
                                    .toList(),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
