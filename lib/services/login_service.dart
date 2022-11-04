import 'package:dio/dio.dart';
import '../common/constants/request.dart';
import 'shared_servicec.dart';

class LogInService {
  void login({
    required String email,
    required String password,
    Function()? beforeSend,
    Function(Map<String, dynamic>)? onSuccess,
    Function(DioError error)? onError,
  }) async {
    var token = await MysharedServices().getSharedToken();
    ApiRequest(
      token: token,
      url: "",
      body: {
        'email': email,
        'password': password,
      },
    ).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (onSuccess != null) onSuccess(data);
      },
      onError: (error) => {
        if (onError != null) onError(error),
      },
    );
  }
}
