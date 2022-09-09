library cloud;

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:mysusenas/app/constans/app_constants.dart';
import 'package:mysusenas/app/features/dashboard/pertanyaan/models/data_model.dart';
import 'package:mysusenas/app/features/dashboard/pertanyaan/views/pertanyaan_view.dart';
import 'package:mysusenas/app/shared_components/book_button.dart';
import 'package:mysusenas/app/shared_components/card_cloud.dart';
import 'package:mysusenas/app/utils/helpers/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gsheets/gsheets.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uuid/uuid.dart';

import '../../../pertanyaan/views/components/selectable_box.dart';

// binding
part '../../bindings/cloud_binding.dart';

// controller
part '../../controllers/cloud_controller.dart';

// model
part '../../models/folder_data.dart';
part '../../models/petugas.dart';
part '../../models/sampel.dart';
part '../../models/fenomena.dart';
// component
part '../components/card_data.dart';
part '../components/card_miskin.dart';
part '../components/header.dart';
part '../components/card_service.dart';
part '../components/card_pemutakhiran.dart';
part '../components/input_monitoring.dart';
part '../components/tabbar.dart';
part '../components/tab_fenomena.dart';
part '../components/pertanyaan_view.dart';

class CloudScreen extends StatelessWidget {
  CloudScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f1eb),
      body: SafeArea(
          child: GetBuilder<CloudController>(
              autoRemove: false,
              // init: CloudController(),
              builder: (c) => SmartRefresher(
                    controller: c.refreshController,
                    onRefresh: c.refreshData,
                    child: Stack(
                      children: [
                        const Padding(
                            padding: EdgeInsets.all(kDefaultSpacing),
                            child: _Header()),
                        _Tabbar(dataMap: c.dataSampelan),
                      ],
                    ),
                  ))),
    );
  }
}
