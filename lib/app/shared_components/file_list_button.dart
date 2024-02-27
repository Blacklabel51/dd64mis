import 'package:dd64mis/app/features/dashboard/home/views/screens/home_screen.dart';
import 'package:dd64mis/app/shared_components/file_type_icon.dart';
import 'package:dd64mis/app/utils/helpers/app_helpers.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';

class FileDetail {
  final String name;
  final int size;
  final FileType type;

  const FileDetail({
    required this.name,
    required this.size,
    required this.type,
  });
}

class FileListButton extends StatelessWidget {
  const FileListButton({
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Kabupaten data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.white,
      child: ListTile(
        // leading: FileTypeIcon(data.type),
        title: Text(
          data.kabkota ?? "Cek",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          data.pPencacahan.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        tileColor: Colors.white,
        onTap: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert_outlined),
          tooltip: "more",
        ),
      ),
    );
  }
}
