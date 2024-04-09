import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app_initializer.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'app_init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt.app_init();
}
