import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar
    );

  }
  AppBar get appBar{
    return AppBar(
      title: Image.asset(AssetsPath.logo_nav),
      actions: [
        CircleIconButton(
          onTap: (){

          },
          iconData: Icons.person_outline,
        ),
        SizedBox(width: 8,),
        CircleIconButton(
          onTap: (){

          },
          iconData: Icons.call,
        ),
        SizedBox(width: 8,),
        CircleIconButton(
          onTap: (){

          },
          iconData: Icons.notifications_active_outlined,
        ),
        SizedBox(width: 8,),
      ],
    );
  }
}

