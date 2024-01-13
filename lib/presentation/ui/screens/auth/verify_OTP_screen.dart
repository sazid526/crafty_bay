import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 160,),
              AppLogo(height: 80,),
              const SizedBox(height:24),
              Text("Enter OTP code",style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height:4),
              Text("A 4 digit OTP code sent your Email Address",style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height:24),
              PinCodeTextField(
                length: 4,
                obscureText: false,

                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.transparent,
                  inactiveFillColor: Colors.transparent,
                  inactiveColor: AppColors.primaryColor
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                onCompleted: (v) {
                  print("Completed");
                }, appContext: context,

              ),
              const SizedBox(height:24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  Get.offAll(CompleteProfileScreen());
                }, child: Text("Next")),
              ),
              SizedBox(height: 16,),
              RichText(text: TextSpan(
                style: TextStyle(
                  color: Colors.grey
                ),
                children: [
                  TextSpan(
                    text: "This code will expire"
                  ),
                  TextSpan(
                    text: "120s",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600
                    )
                  )
                ]
              )),
              TextButton(onPressed: (){

              }, child: Text("Resend Code",style: TextStyle(color: Colors.grey),))
            ],
          ),
        ),
      ),
    );
  }
}
