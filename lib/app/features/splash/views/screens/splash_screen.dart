library splash;

import 'package:dd64mis/app/config/routes/app_pages.dart';
import 'package:dd64mis/app/constans/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// binding
part '../../bindings/splash_binding.dart';

// controller
part '../../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Image.asset(ImageRaster.logo, height: 250),
            Spacer(flex: 1),
            Obx(
              () => Visibility(
                  child: CircularProgressIndicator(),
                  visible: controller.isLoading.value),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
