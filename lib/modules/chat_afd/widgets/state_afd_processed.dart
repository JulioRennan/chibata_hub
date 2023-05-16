import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../afd/widgets/circle_afd.dart';

class StateAFDProcessed extends StatelessWidget {
  const StateAFDProcessed({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAFD(),
          SizedBox(width: 4),
          Column(
            children: [
              Text("1"),
              Image.asset(
                "assets/images/arrow_image.png",
                width: 35,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
