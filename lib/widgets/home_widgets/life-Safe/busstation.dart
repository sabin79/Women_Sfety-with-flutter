import 'package:flutter/material.dart';

class BusStation extends StatelessWidget {
  final Function? onMapFunction;
  const BusStation({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!('Bus Stop near me');
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 50,
                width: 50,
                child: Center(
                  child: Image.asset(
                    'assects/bus-stop.png',
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          Text("Bus Station"),
        ],
      ),
    );
  }
}
