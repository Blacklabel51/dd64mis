library home;

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mysusenas/app/constans/app_constants.dart';
import 'package:mysusenas/app/features/dashboard/cloud/views/screens/cloud_screen.dart';
import 'package:mysusenas/app/shared_components/card_cloud.dart';
import 'package:mysusenas/app/shared_components/custom_button.dart';
import 'package:mysusenas/app/shared_components/file_list_button.dart';
import 'package:mysusenas/app/shared_components/header_text.dart';
import 'package:mysusenas/app/shared_components/search_button.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
              onRefresh: () {
                datapetugas.getPetugas();
                controller.getData();
                controller.getJadwal();
                controller.refreshController.refreshCompleted();
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
                        SizedBox(
                          height: 500,
                          child: _Grafik(
                            data: datapetugas.dataPetugas
                                .where((element) => element.status == 'PCL')
                                .toList(),
                          ),
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
