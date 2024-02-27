part of cloud;

// ignore: avoid_classes_with_only_static_members
///To save the Excel file in the device
Future<String> createFolderInAppDocDir(String folderName) async {
  //Get this App Document Directory
  Directory? path;
  //   if (Platform.isAndroid ||
  //       Platform.isIOS ||
  //       Platform.isLinux ||
  //       Platform.isWindows) {
  //     final Directory directory = await getApplicationSupportDirectory();
  //     path = directory.path;
  //   } else {
  //     path = await PathProviderPlatform.instance.getApplicationSupportPath();
  //   }
  final Directory directory = await getApplicationDocumentsDirectory();
  log(directory.path);
  if (Platform.isAndroid) {
    path = Directory('storage/emulated/0/$folderName');
  } else if (Platform.isWindows) {
    path = Directory('${directory.path}/$folderName');
  }

  var status = await misi.Permission.storage.status;
  if (!status.isGranted) {
    await misi.Permission.storage.request();
  }

  status = await misi.Permission.manageExternalStorage.status;
  if (!status.isGranted) {
    await misi.Permission.manageExternalStorage.request();
  }

  if ((await path!.exists())) {
    log("ada path");
    return path.path;
  } else {
    log("buat path");
    path.create(recursive: true);
    return path.path;
  }
}
