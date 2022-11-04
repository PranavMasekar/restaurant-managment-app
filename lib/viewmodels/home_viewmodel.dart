import 'package:restaurant_app/services/home_service.dart';
import '../locator.dart';
import 'base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  final HomeService _service = locator<HomeService>();
}
