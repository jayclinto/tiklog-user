import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tiklogistics/provider/auth_provider.dart';
import 'package:tiklogistics/utils/app_styles.dart';
import 'firebase_options.dart';
import 'package:tiklogistics/screens/splash_screen.dart';
import 'package:provider/provider.dart';

bool? seenOnboard;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

//widget is the root of application

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tik logistics',
        theme: ThemeData(
          primaryColor: primary,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
