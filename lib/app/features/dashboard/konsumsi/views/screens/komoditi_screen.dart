library konsumsi;

import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:dd64mis/app/constans/app_constants.dart';
import 'package:dd64mis/app/features/dashboard/cloud/views/screens/cloud_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:photo_view/photo_view.dart';
import 'package:collection/collection.dart';

import '../../models/listrik_model.dart';
import '../../models/air.dart';

// binding
part '../../bindings/konsumsi_binding.dart';

// controller
part '../../controllers/konsumsi_controller.dart';

// model
part '../../models/konsumsi.dart';
part '../../models/komoditi.dart';
part '../../models/waktu.dart';
part '../../models/konversi.dart';
part '../../models/art.dart';
part '../../models/pertanyaan.dart';
part '../../models/pendapatan_model.dart';

// component
part '../components/header.dart';
part '../components/tabbar.dart';
part '../components/card_data.dart';
part '../components/foto_zoom.dart';
part '../components/selectable_box.dart';
part '../components/konsumsiNon.dart';
part '../components/pendapatan.dart';
part '../components/pendapatan_gaji.dart';
part '../components/pendapatan_usaha.dart';

//screens
part 'konsumsi_screen.dart';
part 'komoditas_screen.dart';
part 'konsumsinon_screen.dart';
part 'pendapatan_screen.dart';

class KomoditiScreen extends StatelessWidget {
  KomoditiScreen({Key? key}) : super(key: key);

  final TextEditingController tanyaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KonsumsiController>(
        init: KonsumsiController(),
        // autoRemove: false,
        builder: (controller) => Scaffold(
              backgroundColor: const Color(0xfff6f1eb),
              body: SafeArea(
                child: SmartRefresher(
                  controller: controller.refreshController,
                  onRefresh: () {
                    controller.getKomoditi();
                    controller.refreshController.refreshCompleted();
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 68 - (2 * kDefaultSpacing),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: _Header(),
                        ),
                      ),
                      SizedBox(
                        height: Get.height - (160 - (2 * kDefaultSpacing)),
                        child: const _Tabbar(),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
