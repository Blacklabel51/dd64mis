part of kode;

class _Header extends StatelessWidget {
  _Header({Key? key}) : super(key: key);

  TextEditingController txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KodeController>(
        // initState: (state) {
        //   txtController = TextEditingController();
        // },
        // autoRemove: false,
        builder: (controller) => Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: _title("Kode Kegiatan Usaha", context),
                )),
                SearchBarAnimation(
                    // hintText: "Cari Disini",
                    enableKeyboardFocus: true,
                    durationInMilliSeconds: 500,
                    textEditingController: controller.textController,
                    isOriginalAnimation: false,
                    buttonBorderColour: Colors.black45,
                    buttonIcon: Icons.search,
                    onChanged: (text) {
                      controller.search(text);
                    },
                    onCollapseComplete: () {
                      print("close ini");
                      controller.textController.clear();
                      controller.search('');
                    },
                    isSearchBoxOnRightSide: true),
              ],
            ));
  }

  Widget _title(String data, context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.7,
      child: Text(
        data,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
