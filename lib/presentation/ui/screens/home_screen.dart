import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/image_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: "All Categories",
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              const SizedBox(height: 8,),
              SectionTitle(
                title: "Populer",
                onTapSeeAll: () {
                  Get.to(ProductListScreen());
                },
              ),
              productList,
              const SizedBox(height: 8,),
              SectionTitle(
                title: "Special",
                onTapSeeAll: () {},
              ),
              productList,
              const SizedBox(height: 8,),
              SectionTitle(
                title: "New",
                onTapSeeAll: () {},
              ),
              productList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CategoryItem();
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  SizedBox get productList {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ProductCardItem();
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  TextFormField get searchTextFeild {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.logo_nav),
      actions: [
        CircleIconButton(
          onTap: () {},
          iconData: Icons.person_outline,
        ),
        SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_active_outlined,
        ),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}

