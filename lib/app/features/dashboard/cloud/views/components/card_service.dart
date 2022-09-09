part of cloud;

class _CardService extends StatelessWidget {
  const _CardService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [],
      options: CarouselOptions(
        height: CardCloud.height,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(seconds: 2),
        autoPlayInterval: Duration(seconds: 5),
        viewportFraction: 1,
      ),
    );
  }
}
