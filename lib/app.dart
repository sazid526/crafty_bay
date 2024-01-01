import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors.colorSwatch),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primaryColor
        ),
        inputDecorationTheme:  InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          hintStyle: TextStyle(
            color: Colors.grey.shade400
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor
            )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primaryColor
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primaryColor
              )
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.red
              )
          ),

        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade600
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 14),
            textStyle: const TextStyle(
              fontSize: 14,
              letterSpacing: 0.5
            ),
            foregroundColor: Colors.white
          )
        )
      ),
      home: SplashScreen(),
    );
  }
}
