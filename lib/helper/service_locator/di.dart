import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_bloc_test/helper/service_locator/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureInjection() => getIt.init();
