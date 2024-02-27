library kode;

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
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
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:uuid/uuid.dart';

// binding
part '../../bindings/kode_binding.dart';

// controller
part '../../controllers/kode_controller.dart';

// model
part '../../models/kode.dart';

// component
part '../components/category.dart';
part '../components/header.dart';
part '../components/tabbar.dart';
part '../components/card_data.dart';

class KodeScreen extends StatelessWidget {
  KodeScreen({Key? key}) : super(key: key);

  TextEditingController tanyaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KodeController>(
        init: KodeController(),
        // autoRemove: false,
        builder: (controller) => Scaffold(
              backgroundColor: const Color(0xfff6f1eb),
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: FloatingActionButton(
                  backgroundColor: const Color(0xff03dac6),
                  foregroundColor: Colors.black,
                  onPressed: () {
                    Get.defaultDialog(
                        title: ("Kegiatan/Pekerjaan"),
                        confirm: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(120, 50),
                                primary: const Color(0xff3e786f)),
                            onPressed: () {
                              controller.isLoading == true;
                              controller.update();
                              controller.tanya(tanyaController.text);
                              tanyaController.clear();
                            },
                            child: const Text("Kirim",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))),
                        cancel: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(120, 50),
                                primary: Colors.redAccent),
                            onPressed: () {
                              tanyaController.clear();
                              Get.back();
                            },
                            child: const Text("Batal",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))),
                        content: GetBuilder<KodeController>(
                            // init: KodeController(),
                            builder: (controller) => (controller.isLoading)
                                ? const CircularProgressIndicator()
                                : Container(
                                    height: 100,
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
                                    child: TextFormField(
                                        controller: tanyaController,
                                        decoration: InputDecoration(
                                            fillColor: const Color(0xffF1F0F5),
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(),
                                            ),
                                            hintText:
                                                'Contoh : Operator Mesin di PT Vale',
                                            hintStyle: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 13))),
                                  )));
                  },
                  child: const Icon(Icons.question_mark),
                ),
              ),
              body: SafeArea(
                child: SmartRefresher(
                  controller: controller.refreshController,
                  onRefresh: () {
                    controller.getData();
                    controller.refreshController.refreshCompleted();
                  },
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: _Header(),
                            ),
                            Container(
                              height:
                                  Get.height - 100 - (2 * kDefaultSpacing) - 20,
                              child: const _Tabbar(),
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
