import 'package:get_it/get_it.dart';
import 'services/home_service.dart';
import 'services/login_service.dart';
import 'viewmodels/home_viewmodel.dart';
import 'viewmodels/login_viewmodel.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  /// Services
  locator.registerSingleton<HomeService>(HomeService());
  locator.registerSingleton<LogInService>(LogInService());

  /// ViewModel
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
}
