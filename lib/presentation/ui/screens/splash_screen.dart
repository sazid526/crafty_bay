import 'package:crafty_bay/presentation/ui/screens/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToNextScreen();
  }
  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2),);
    Get.offAll(const VerifyEmailScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Spacer(),
          Image.asset(AssetsPath.logo,width: 120,),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(height: 8,),
          Text("Version 1.0"),
          const SizedBox(height: 8,)
        ],
      )),
    );
  }
}
