import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Spacer(),
          Image.asset(AssetsPath.logo,width: 120,),
          Spacer(),
          const SizedBox(height: 8,),
          Text("Version 1.0"),
          const SizedBox(height: 8,)
        ],
      )),
    );
  }
}
