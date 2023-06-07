import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_widgets/life-Safe/busstation.dart';
import 'home_widgets/life-Safe/hospital.dart';
import 'home_widgets/life-Safe/pharmacy.dart';
import 'home_widgets/life-Safe/policestation.dart';

class LifeSaver extends StatelessWidget {
  const LifeSaver({super.key});

  static Future<void> openMap(String location) async {
    String googleurl = 'https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleurl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(msg: 'something went ! call emmergency number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceStation(
            onMapFunction: openMap,
          ),
          Hospital(
            onMapFunction: openMap,
          ),
          Pharmacy(
            onMapFunction: openMap,
          ),
          BusStation(
            onMapFunction: openMap,
          ),
        ],
      ),
    );
  }
}
