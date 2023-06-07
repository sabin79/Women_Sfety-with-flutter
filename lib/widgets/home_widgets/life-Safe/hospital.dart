import 'package:flutter/material.dart';

class Hospital extends StatelessWidget {
  final Function? onMapFunction;
  const Hospital({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!('Hospital near me');
            },
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                height: 50,
                width: 50,
                child: Center(
                  child: Image.asset(
                    'assects/hospital.png',
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          Text("Hosital"),
        ],
      ),
    );
  }
}
