import 'package:get_it/get_it.dart';
import 'package:get_it_and_benefit/main.dart';

GetIt core = GetIt.instance;

init() {
  // core.registerFactory(() => DateTime.now());
  core.registerSingleton(DateTime.now());
  core.registerSingleton(HomePage());
}
