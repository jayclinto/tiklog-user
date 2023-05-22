import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:tiklogistics/screens/history_view_screen.dart';

import '../utils/app_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning, Chioma",
                          style: Styles.headLineStyle4,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Deliver Packages",
                          style: Styles.headLineStyle1,
                        ),
                      ],
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("assets/logo.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(
                      left: 20, top: 10, right: 20, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        cursorColor: Colors.black12,
                        decoration: InputDecoration(
                          hintText: "Enter Tracking ID",
                          hintStyle: Styles.headLineStyle4,
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            padding:
                                const EdgeInsetsDirectional.only(end: 12.0),
                            onPressed: () {},
                            icon: const Icon(
                              FluentSystemIcons.ic_fluent_send_filled,
                              color: Color(0xff0185cd),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery History",
                      style: Styles.headLineStyle2,
                    ),
                    InkWell(
                      onTap: () {
                        print("tapped");
                      },
                      child: Text(
                        "View all",
                        style: Styles.textStyle
                            .copyWith(color: Styles.primaryColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const HistoryView(),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          width: 165,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(
                                FluentSystemIcons.ic_fluent_clock_filled,
                                color: Colors.black,
                                size: 50,
                              ),
                              Text("Pick Up"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          width: 165,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(
                                FluentSystemIcons.ic_fluent_clock_filled,
                                color: Colors.black,
                                size: 50,
                              ),
                              Text("Delivery"),
                            ],
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(
                      left: 20, top: 15, right: 20, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FluentSystemIcons.ic_fluent_search_regular,
                            color: Colors.black,
                          ),
                          InkWell(
                            onTap: () {},
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "Deliver to?",
                                style: Styles.headLineStyle3
                                    .copyWith(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Styles.bgColor,
                        ),
                        padding: const EdgeInsets.only(
                            left: 20, top: 5, right: 20, bottom: 5),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              FluentSystemIcons.ic_fluent_clock_filled,
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text("Now",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(width: 5),
                            Icon(
                              FluentSystemIcons.ic_fluent_chevron_down_filled,
                              color: Colors.black,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 10, top: 20, right: 10, bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FluentSystemIcons.ic_fluent_clock_filled,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Intake Education Abuja",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Ground floor, 50, Adetokubu Ademola Crescent,  ",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Icon(
                            FluentSystemIcons.ic_fluent_clock_filled,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Fadama Hotel, Arab Road, Kubwa",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "588+5MC, Arab Rd, bua,Federal Capital Territory",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
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
