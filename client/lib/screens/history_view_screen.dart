import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tiklogistics/utils/app_layout.dart';

import '../utils/app_styles.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return SizedBox(
      width: size.width,
      height: 150,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff526799),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(21), topRight: Radius.circular(21)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "NYC",
                      style:
                          Styles.headLineStyle3.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      "LDN",
                      style:
                          Styles.headLineStyle3.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
