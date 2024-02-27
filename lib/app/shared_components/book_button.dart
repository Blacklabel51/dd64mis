import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class BookButton extends StatelessWidget {
  const BookButton({required this.badge, required this.onPressed, Key? key})
      : super(key: key);
  final String badge;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.bottomStart(start: -5, bottom: -5),
      badgeContent: Text(
        badge,
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: IconButton(
          constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
          iconSize: 15,
          padding: EdgeInsets.all(10),
          onPressed: onPressed,
          icon: Icon(Icons.article_rounded),
          tooltip: "Search",
        ),
      ),
    );
  }
}
