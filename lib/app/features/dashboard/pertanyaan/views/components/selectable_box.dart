import 'package:flutter/material.dart';

class SelectableBox extends StatelessWidget {
  final bool isSelected;
  final bool isEnabled;
  final double width;
  final double height;
  final double margin;
  final String text;
  final Function? onTap;
  final TextStyle? textStyle;

  SelectableBox(this.text,
      {this.isSelected = false,
      this.isEnabled = true,
      this.width = 132,
      this.height = 90,
      this.margin = 13,
      this.onTap,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        // margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
        alignment: Alignment.center,
        width: width,
        height: MediaQuery.of(context).size.height / 15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (!isEnabled)
                ? Color(0xFFE4E4E4)
                : isSelected
                    ? Color(0xffda902a)
                    : Colors.transparent,
            border: Border.all(
                color: (!isEnabled)
                    ? Color(0xFFE4E4E4)
                    : isSelected
                        ? Color(0xffda902a)
                        : Color(0xffdedede))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.white : Colors.black45,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
