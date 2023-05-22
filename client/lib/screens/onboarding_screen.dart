// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiklogistics/models/onboarding_data.dart';
import 'package:tiklogistics/screens/auth/register_screen.dart';
import 'package:tiklogistics/screens/auth/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:tiklogistics/provider/auth_provider.dart';
import 'package:tiklogistics/screens/bottom_bar.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        // width: 80,
                        height: 60,
                      ),
                      const Text(
                        "TIKLOG",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.2575,
                          letterSpacing: -0.84,
                          color: Color(0xff0185cd),
                        ),
                      ),
                      SvgPicture.asset(
                        contents[i].image,
                        height: 300,
                      ),
                      Text(
                        contents[i].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          height: 1.2575,
                          color: Color(0xff6b6b6b),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[i].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => Container(
                  height: 8,
                  width: currentIndex == index ? 25 : 10,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xff0185cd),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff0185cd),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xffffffff)),
                    ),
                    child: Text(
                      currentIndex == contents.length - 1
                          ? "Get Started"
                          : "Next",
                    ),
                    onPressed: () {
                      if (currentIndex == contents.length - 1) {
                        ap.isSignedIn == true
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomBar()))
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const RegisterScreen()));
                      }
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                  ),
                ),
                Container(
                  width: 16,
                  height: 12,
                  child: SvgPicture.asset(
                    "assets/arrow_sm.svg",
                    width: 16,
                    height: 12,
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
