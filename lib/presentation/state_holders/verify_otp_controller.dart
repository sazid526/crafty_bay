import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import 'package:crafty_bay/data/utility/urls.dart';


class VerifyOTPcontroller extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMassage =  "";

  String get errorMassage => _errorMassage;

  Future<bool> verifyOTP(String email , String otp)async{
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;
    update();
    if(response.isSuccess){
      final token = response.responseData["data"];
      update();
      return true;
    }else{
      _errorMassage = response.errorMassage;
      update();
      return false;
    }
  }

}