part of cloud;

class InputMonitoring extends StatelessWidget {
  const InputMonitoring({required this.inputData, Key? key}) : super(key: key);

  final Sampel inputData;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CloudController(), permanent: true);
    return Scaffold(
        body: SafeArea(
            child: Container(
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Text(
            "${inputData.namaRuta} input monitoring",
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(height: 30),
          const Text(
            "Status Pencacahan",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16),
          ),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            controller: c.sPencacahan,
            // enabled: false,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Status Pencacahan",
                hintText: "Status Pencacahan"),
          ),
          const SizedBox(height: 10),
          const Text(
            "Status Dokumen Clean",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16),
          ),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            controller: c.sDokClean,
            // enabled: false,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Status Dokumen Clean",
                hintText: "Status Dokumen Clean"),
          ),
          const SizedBox(height: 10),
          const Text(
            "Status Pemeriksaan",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16),
          ),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            controller: c.sPemeriksaan,
            // enabled: false,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Status Pemeriksaan",
                hintText: "Status Pemeriksaan"),
          ),
          const SizedBox(height: 10),
          const Text(
            "Status Pengolahan",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16),
          ),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            controller: c.sOlah,
            // enabled: false,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Status Pengolahan",
                hintText: "Status Pengolahan"),
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {
                print("object yoyoyoyoy");
                c.updateSampel(inputData.no!, {
                  'sPencacahan': c.sPencacahan.text,
                  'sDokClean': c.sDokClean.text,
                  'sPemeriksaan': c.sPemeriksaan.text,
                  'sOlah': c.sOlah.text
                });
                Get.back();
              },
              child: const Text("Save"))
        ])),
      ]),
    )));
  }
}
