import 'package:flutter/foundation.dart';

class BaseViewModel extends ChangeNotifier {
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  //Setters
  void setState() {
    notifyListeners();
  }

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }
}
