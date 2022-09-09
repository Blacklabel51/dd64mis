import 'package:flutter/material.dart';
import 'package:location/location.dart';

class GetCurrentProv extends StatelessWidget {
  final Location location = new Location();
  final String? locationData;
  final String? koordinatDerjat;
  final bool? isloading;
  final Function? onTap;
  final Function? onTapmanual;

  GetCurrentProv(
      {required this.isloading,
      required this.onTap,
      required this.onTapmanual,
      required this.koordinatDerjat,
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
                  Text('Koordinat :', textAlign: TextAlign.center),
                  Text(locationData!, textAlign: TextAlign.center),
                  Text(koordinatDerjat!, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          isloading!
              ? new CircularProgressIndicator(color: Color(0xffda902a))
              : Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffda902a),
                        ),
                        onPressed: () {
                          onTap!();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.gps_fixed),
                            Text(
                              'Lokasi',
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffda902a),
                        ),
                        onPressed: () {
                          onTapmanual!();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.edit),
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
