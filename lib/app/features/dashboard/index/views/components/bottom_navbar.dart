part of dashboard;

class _BottomNavbar extends StatelessWidget {
  _BottomNavbar(
      {required this.currentIndex, required this.onSelected, Key? key})
      : super(key: key);

  final Function(int index) onSelected;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedIconTheme: IconThemeData(size: 28, color: Color(0xffda902a)),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/vector/home.svg"),
          activeIcon: SvgPicture.asset("assets/images/vector/home_active.svg"),
          tooltip: "home",
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/vector/wishlist.svg"),
          activeIcon:
              SvgPicture.asset("assets/images/vector/wishlist_active.svg"),
          label: "sampel",
          tooltip: "sampel",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/vector/profile.svg"),
          activeIcon:
              SvgPicture.asset("assets/images/vector/profile_active.svg"),
          label: "Kode",
          tooltip: "Kode",
        ),
        // BottomNavigationBarItem(
        //   icon: SvgPicture.asset("assets/images/vector/cart.svg"),
        //   activeIcon: SvgPicture.asset("assets/images/vector/cart_active.svg"),
        //   label: "Konsumsi",
        //   tooltip: "Konsumsi",
        // ),
      ],
      onTap: (value) {
        onSelected(value);
      },
    );
  }
}
