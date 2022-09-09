part of konsumsi;

class FotoZoom extends StatelessWidget {
  const FotoZoom({
    Key? key,
    required this.link,
  }) : super(key: key);

  final String link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Get.to(() => PhotoView(
              basePosition: Alignment.center,
              backgroundDecoration: const BoxDecoration(
                color: Color(0xfff6f1eb),
              ),
              imageProvider: AssetImage(
                "assets/images/susenas/$link",
              ),
            ));
      },
      child: Image.asset(
        "assets/images/susenas/$link",
      ),
    );
  }
}
