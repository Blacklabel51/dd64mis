part of cloud;

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CloudController>(
        autoRemove: false,
        // init: CloudController(),
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _title(
                    (controller.petugasTerpilih.nama != null)
                        ? "${controller.petugasTerpilih.nama}/${controller.petugasTerpilih.status}"
                        : "",
                    context),
                Spacer(),
                BookButton(
                    badge: controller.badgesoffline.toString(),
                    onPressed: () {
                      controller.updateOffline();
                      controller.getPertanyaan();
                      controller.getSampel();
                      Get.defaultDialog(
                        content: Align(
                            child: SizedBox(
                                height: 240,
                                child: Lottie.asset(
                                    'assets/animasi/success.json'))),
                        title: "Update Kuesioner",
                        confirm: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff3e786f))),
                            onPressed: () => Get.back(),
                            child: const Text("Siap")),
                      );
                    }),
              ],
            ));
  }

  Widget _title(String data, context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Text(
        "Hi, $data",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
