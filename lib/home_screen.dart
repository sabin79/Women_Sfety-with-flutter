import 'dart:math';

import 'package:flutter/material.dart';
import 'package:womensafety/widgets/home_widgets/cutomappbar.dart';

import 'widgets/home_widgets/CustomCarouel.dart';
import 'widgets/home_widgets/Safe- Home/safeHome.dart';
import 'widgets/home_widgets/emergency.dart';
import 'widgets/lifesaver.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({super.key});
  int qIndex = 0;

  GetRandom() {
    Random? random = Random();

    setState(() {
      qIndex = random.nextInt(6);
    });
  }

  @override
  void initstate() {
    GetRandom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Customappbar(
                  quoteIndex: qIndex,
                  onTap: () {
                    GetRandom();
                  }),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    CustomCarouel(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Emergency",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Emergency(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Explore LiveSafe",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    LifeSaver(),
                    SafeHome(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
