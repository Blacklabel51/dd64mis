part of cloud;

class PertanyaanViewFenomena extends GetView<CloudController> {
  PertanyaanViewFenomena({required this.dataMap, Key? key}) : super(key: key);
  final Fenomena? dataMap;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var pendataan = {
      "1": "Penurunan",
      "0": "Tetap",
      "2": "Peningkatan",
    };
    var kategori = {
      "Pertanian": "Pertanian",
      "Pertambangan": "Pertambangan",
      "Industri": "Industri",
      "Perdagangan": "Perdagangan",
      "Lainnya": "Lainnya",
    };

    Fenomena data = dataMap ?? Fenomena.kosong();
    return Scaffold(
        // backgroundColor: Warna.background,
        body: SafeArea(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 80),
              child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Stack(children: [
                          GestureDetector(
                              onTap: () {
                                // controller.reset();
                                Get.back();
                              },
                              child: Ikon.back),
                          const SizedBox(),
                          const Center(
                              child: Text("Tambah Fenomena",
                                  style: TeksStyle.subjudul))
                        ]),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                          child: Column(
                            children: [
                              const Text("Fenomena", style: TeksStyle.subjudul),
                              TextFormField(
                                maxLines: 3,
                                initialValue: data.fenomena,
                                decoration: InputDecoration(
                                  hintText: "Fenomena yang Ditemukan",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                ),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Wajib diisi bosku';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  controller.nilaifenomena("fenomena", value);
                                },
                              ),
                            ],
                          )),
                      Column(
                        children: [
                          const Text("Kategori", style: TeksStyle.subjudul),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                              child: GetBuilder<CloudController>(
                                id: "kategori",
                                initState: (_) {
                                  controller.initfenomena(
                                      "kategori", data.kategori!);
                                },
                                builder: (c) {
                                  return Wrap(
                                      spacing: 1,
                                      runSpacing: 7,
                                      children: kategori.entries
                                          .map((e) => SelectableBox(e.value,
                                                  isSelected: c.nilai == e.key,
                                                  onTap: () {
                                                c.nilaifenomena(
                                                    "kategori", e.key);
                                              }))
                                          .toList());
                                },
                              )),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                          child: Column(
                            children: [
                              const Text("Wilayah", style: TeksStyle.subjudul),
                              TextFormField(
                                initialValue: data.wilayah,
                                decoration: InputDecoration(
                                  hintText: "Wilayah yang Terdampak",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                ),
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  controller.nilaifenomena("wilayah", value);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Wajib diisi bosku';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          )),
                      Column(
                        children: [
                          const Text("Dampak Jumlah Orang yang Bekerja",
                              style: TeksStyle.subjudul),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                              child: GetBuilder<CloudController>(
                                id: "bekerja",
                                initState: (_) {
                                  controller.initfenomena(
                                      "bekerja", data.bekerja!);
                                },
                                builder: (c) {
                                  // c.nilai = "0";

                                  return Wrap(
                                      spacing: 3,
                                      runSpacing: 3,
                                      children: pendataan.entries
                                          .map((e) => SelectableBox(e.value,
                                                  isSelected: c.nilai == e.key,
                                                  onTap: () {
                                                c.nilaifenomena(
                                                    "bekerja", e.key);
                                              }))
                                          .toList());
                                },
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                              "Dampak Jumlah Pendapatan/Upah Tenaga Kerja",
                              style: TeksStyle.subjudul),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                              child: GetBuilder<CloudController>(
                                id: "pendapatan",
                                initState: (_) {
                                  controller.initfenomena(
                                      "pendapatan", data.pendapatan!);
                                },
                                builder: (c) => Wrap(
                                    spacing: 3,
                                    runSpacing: 3,
                                    children: pendataan.entries
                                        .map((e) => SelectableBox(e.value,
                                                isSelected: c.nilai == e.key,
                                                onTap: () {
                                              c.nilaifenomena(
                                                  "pendapatan", e.key);
                                            }))
                                        .toList()),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Dampak Jumlah Orang yang Menganggur",
                              style: TeksStyle.subjudul),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                              child: GetBuilder<CloudController>(
                                id: "pengangguran",
                                initState: (_) {
                                  controller.initfenomena(
                                      "pengangguran", data.pengangguran!);
                                },
                                builder: (c) => Wrap(
                                    spacing: 5,
                                    runSpacing: 5,
                                    children: pendataan.entries
                                        .map((e) => SelectableBox(e.value,
                                                isSelected: c.nilai == e.key,
                                                onTap: () {
                                              c.nilaifenomena(
                                                  "pengangguran", e.key);
                                            }))
                                        .toList()),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                              "Dampak Jumlah Orang yang Bukan Angkatan Kerja",
                              style: TeksStyle.subjudul),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                              child: GetBuilder<CloudController>(
                                id: "bak",
                                initState: (_) {
                                  controller.initfenomena("bak", data.bak!);
                                },
                                builder: (c) => Wrap(
                                    spacing: 3,
                                    runSpacing: 3,
                                    children: pendataan.entries
                                        .map((e) => SelectableBox(e.value,
                                                isSelected: c.nilai == e.key,
                                                onTap: () {
                                              c.nilaifenomena("bak", e.key);
                                            }))
                                        .toList()),
                              )),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                          child: Column(
                            children: [
                              const Text("Link/Sumber Informasi",
                                  style: TeksStyle.subjudul),
                              TextFormField(
                                initialValue: data.link!,
                                decoration: InputDecoration(
                                  hintText: "Tambahkan link/sumber jika ada",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                ),
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  controller.nilaifenomena("wilayah", value);
                                },
                              ),
                            ],
                          )),
                    ]))
                  ]),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GetBuilder<CloudController>(
            builder: (c) => FloatingActionButton.extended(
                  onPressed: () {
                    if (c.values.isEmpty) {
                      Get.back();
                    } else {
                      if (!_formkey.currentState!.validate()) {
                        return;
                      }
                      c.updateFenomena(data.no!);
                      c.getFenomena();
                      Get.back();
                    }
                  },
                  label: (c.values.isEmpty)
                      ? const Text("Batal")
                      : const Text("Simpan"),
                  icon: (c.values.isEmpty)
                      ? const Icon(Icons.access_alarm)
                      : const Icon(Icons.cable),
                )));
  }
}
