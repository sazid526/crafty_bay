import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
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
              Text("Welcome back",style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height:4),
              Text("Please enter email address",style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height:16),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email"
                ),
              ),
              const SizedBox(height:24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){

                }, child: Text("Next")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
