import 'package:flutter/material.dart';
import 'package:location/location.dart';

class GetDate extends StatelessWidget {
  final Location location = new Location();
  final String? locationData;
  final String? label;
  final Function? onTapnow;
  final Function? onTap;

  GetDate(
      {required this.label,
      required this.onTap,
      required this.onTapnow,
      required this.locationData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // padding: const EdgeInsets.all(kDefaultSpacing),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
        gradient: LinearGradient(colors: [
          Colors.grey,
          Colors.grey.withOpacity(.5),
        ]),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('$label :', textAlign: TextAlign.center),
                  Text(locationData!, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffda902a),
                  ),
                  onPressed: () {
                    onTapnow!();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today),
                      Text(
                        'Sekarang',
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffda902a),
                  ),
                  onPressed: () {
                    onTap!();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.calendar_view_week),
                      Text(
                        'Manual',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
