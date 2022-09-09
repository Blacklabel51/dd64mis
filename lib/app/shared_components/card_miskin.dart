import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardMiskin extends StatelessWidget {
  const CardMiskin(
      {required this.label,
      required this.nks,
      required this.pcl,
      required this.status,
      this.width,
      Key? key})
      : super(key: key);

  final String label;
  final String nks;
  final String pcl;
  final String status;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 112,
      // width: width ?? 200,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffFEF5ED),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: .2,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: (status == "")
                ? Icon(Icons.sentiment_neutral_rounded, color: Colors.grey)
                : (status == "Miskin")
                    ? Icon(Icons.sentiment_very_dissatisfied_sharp,
                        color: Colors.redAccent)
                    : Icon(Icons.sentiment_satisfied_sharp,
                        color: Colors.greenAccent),
            title: Text(
              label.capitalizeFirst!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              "NKS : $nks $pcl ",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            contentPadding: const EdgeInsets.all(0),
          ),
          // _typeIcons(fileType),
        ],
      ),
    );
  }
}
