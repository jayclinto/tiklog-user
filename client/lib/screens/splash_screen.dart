import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../firebase_services/splash_services.dart';
// import 'package:provider/provider.dart';
// import 'package:tiklogistics/provider/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    //final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xffedf6fb),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 120,
            ),
            const Text(
              "TIKLOG",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.2575,
                letterSpacing: -1.44,
                color: Color(0xff0185cd),
              ),
            )
          ],
        ),
      ),
    );
  }
}
