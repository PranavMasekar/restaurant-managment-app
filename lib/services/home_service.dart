import 'package:dio/dio.dart';

import '../common/constants/request.dart';
import 'shared_servicec.dart';

class HomeService {
  void updatePhone({
    required String existingPhone,
    required String newPhone,
    Function()? beforeSend,
    Function(Map<String, dynamic>)? onSuccess,
    Function(DioError error)? onError,
  }) async {
    var token = await MysharedServices().getSharedToken();
    ApiRequest(
      token: token,
      url: "",
      body: {
        'old_phone': existingPhone,
        'new_phone': newPhone,
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
