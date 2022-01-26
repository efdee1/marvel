import 'package:get_it/get_it.dart';
import 'package:marvel/view_model/application_view_model.dart';


GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => ApplicationViewModel());

}