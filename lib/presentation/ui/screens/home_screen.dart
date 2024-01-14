import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/image_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/section_title_widgets.dart';
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
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              searchTextFeild,
              const SizedBox(
                height: 16,
              ),
              ImageCarousel(),
              SizedBox(height: 16,),
              SectionTitleWidget(
                title: "All Categories",
                onTapSeeAll: ()
                {

                },
              )
            ],
          ),
        ),
      ),
    );

  }

  TextFormField get searchTextFeild {
    return TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search,color: Colors.grey,),
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none
                ),
              ),
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



