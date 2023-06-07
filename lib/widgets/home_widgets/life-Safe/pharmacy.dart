import 'package:flutter/material.dart';

class Pharmacy extends StatelessWidget {
  final Function? onMapFunction;
  const Pharmacy({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!('Pharmacy near me');
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                height: 50,
                width: 50,
                child: Center(
                  child: Image.asset(
                    'assects/pharmacy.png',
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          Text("Pharmacy"),
        ],
      ),
    );
  }
}
