library dashboard;

import 'package:dd64mis/app/features/dashboard/cloud/views/screens/cloud_screen.dart';
import 'package:dd64mis/app/features/dashboard/home/views/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dd64mis/app/features/dashboard/kode/views/screens/kode_screen.dart';
import 'package:dd64mis/app/features/dashboard/konsumsi/views/screens/komoditi_screen.dart';

// binding
part '../../bindings/dashboard_binding.dart';

// controller
part '../../controllers/dashboard_controller.dart';

// model

// component
part '../components/bottom_navbar.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({Key? key}) : super(key: key);
  late DateTime currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          DateTime now = DateTime.now();
          if (currentBackPressTime == null ||
              now.difference(currentBackPressTime) > Duration(seconds: 2)) {
            currentBackPressTime = now;
            Get.snackbar("warning", "mau keluar?");
            return Future.value(false);
          }
          return Future.value(true);
        },
        child: PageView(
          controller: controller.page,
          onPageChanged: (index) => controller.onChangedPage(index),
          children: [HomeScreen(), CloudScreen(), KodeScreen()],
        ),
      ),
      bottomNavigationBar: Obx(
        () => _BottomNavbar(
          currentIndex: controller.currentIndex.value,
          onSelected: (index) {
            controller.changePage(index);
          },
        ),
      ),
    );
  }
}
