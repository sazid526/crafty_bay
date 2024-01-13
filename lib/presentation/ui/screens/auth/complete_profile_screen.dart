import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 80,),
              AppLogo(height: 70,),
              const SizedBox(height:16),
              Text("Complete Profile",style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height:4),
              Text("Get started with your details",style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height:16),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "First Name"
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height:16),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Last Name"
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height:16),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Mobile"
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height:16),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "City"
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height:16),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                    hintText: "Shipping Address"
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height:16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  Get.offAll(MainBottomNavScreen());
                }, child: Text("Complete")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
