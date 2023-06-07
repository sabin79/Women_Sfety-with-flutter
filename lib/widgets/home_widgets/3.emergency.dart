import 'package:flutter/material.dart';

import 'emmergencies/ambulance.dart';
import 'emmergencies/childhelpline.dart';
import 'emmergencies/police.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceEmergency(),
          AmbulanceEmergency(),
          armyEmergency(),
        ],
      ),
    );
  }
}
