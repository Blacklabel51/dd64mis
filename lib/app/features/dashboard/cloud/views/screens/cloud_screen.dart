library cloud;

import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:dd64mis/app/constans/app_constants.dart';
import 'package:dd64mis/app/features/dashboard/pertanyaan/models/data_model.dart';
import 'package:dd64mis/app/features/dashboard/pertanyaan/views/pertanyaan_view.dart';
import 'package:dd64mis/app/shared_components/book_button.dart';
import 'package:dd64mis/app/shared_components/card_cloud.dart';
import 'package:dd64mis/app/utils/helpers/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gsheets/gsheets.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uuid/uuid.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as sync;
import 'package:permission_handler/permission_handler.dart' as misi;
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import '../../../pertanyaan/views/components/selectable_box.dart';

// binding
part '../../bindings/cloud_binding.dart';

// controller
part '../../controllers/cloud_controller.dart';

// model
part '../../models/folder_data.dart';
part '../../models/petugas.dart';
part '../../models/sampel.dart';
part '../../models/updating.dart';
part '../../models/fenomena.dart';
part '../../models/Gk.dart';
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
part '../components/save_file.dart';

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
                    header: const ClassicHeader(
                        failedText: "Gagal guys",
                        completeText: "Berhasil",
                        refreshingText: "Sabar ki"),
                    onRefresh: c.refreshData,
                    child: Stack(
                      children: [
                        const Padding(
                            padding: EdgeInsets.all(kDefaultSpacing),
                            child: _Header()),
                        Tabbar(dataMap: c.dataSampelan),
                      ],
                    ),
                  ))),
    );
  }
}
