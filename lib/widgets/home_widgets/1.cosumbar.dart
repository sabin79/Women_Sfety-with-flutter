import 'package:flutter/material.dart';

import '../../utils/quotes.dart';

class Customappbar extends StatelessWidget {
  // const Customappbar({super.key});
  Function? onTap;
  int? quoteIndex;
  Customappbar({this.onTap, this.quoteIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        child: Text(
          sweetSayings[quoteIndex!],
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
