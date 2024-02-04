import 'package:crafty_bay/data/models/create_profile_params.dart';
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circuler_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEcontroller = TextEditingController();
  final TextEditingController _lastNameTEcontroller = TextEditingController();
  final TextEditingController _mobileTEcontroller = TextEditingController();
  final TextEditingController _cityTEcontroller = TextEditingController();
  final TextEditingController _shippingAddressTEcontroller =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                AppLogo(
                  height: 70,
                ),
                const SizedBox(height: 16),
                Text(
                  "Complete Profile",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  "Get started with your details",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _firstNameTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter first name";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(hintText: "First Name"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _lastNameTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter last name";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(hintText: "Last Name"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _mobileTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter mobile number";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(hintText: "Mobile"),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _cityTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter city name";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(hintText: "City"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shippingAddressTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Shipping Address";
                    } else {
                      return null;
                    }
                  },
                  maxLines: 4,
                  decoration:
                      const InputDecoration(hintText: "Shipping Address"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CompleteProfileController>(
                      builder: (completeProfileController) {
                    return Visibility(
                      visible: completeProfileController.inProgress == false,
                      replacement: const CenterCirculerProgressIndicator(),
                      child: ElevatedButton(
                          onPressed: () async {
                            final createProfileParams = CreateProfileParams(
                              firstName: _firstNameTEcontroller.text.trim(),
                              lastName: _lastNameTEcontroller.text.trim(),
                              mobile: _mobileTEcontroller.text.trim(),
                              city: _cityTEcontroller.text.trim(),
                              shippingAddress:
                                  _shippingAddressTEcontroller.text.trim(),
                            );
                            if (_formKey.currentState!.validate()) {
                              final bool result =
                                  await completeProfileController
                                      .createProfileData(
                                          Get.find<VerifyOTPcontroller>().token,
                                          createProfileParams);

                              if (result) {
                                Get.offAll(const MainBottomNavScreen());
                              }
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: "Complete Profile Failed",
                                message: completeProfileController.errorMassage,
                                duration: const Duration(seconds: 2),
                                isDismissible: true,
                              ));
                            }
                          },
                          child: Text("Complete")),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstNameTEcontroller.dispose();
    _lastNameTEcontroller.dispose();
    _mobileTEcontroller.dispose();
    _cityTEcontroller.dispose();
    _shippingAddressTEcontroller.dispose();

    super.dispose();
  }
}
