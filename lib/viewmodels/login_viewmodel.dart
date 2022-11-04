import 'dart:developer';
import 'package:restaurant_app/services/login_service.dart';
import '../locator.dart';
import 'base_viewmodel.dart';

class LoginViewModel extends BaseViewModel {
  bool isLoading = false;
  String errorMsg = "";
  final LogInService _service = locator<LogInService>();

  Future login(String email, String password) async {
    isLoading = true;
    notifyListeners();
    _service.login(
      email: email,
      password: password,
      onSuccess: (data) {
        log(data.toString());
      },
      onError: (error) {
        errorMsg = error.message;
      },
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> onModelReady() async {}
}
