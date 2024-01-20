// Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:realtime_innovation_assignment/injection/injection.config.dart';
// Project imports:

final GetIt getIt = GetIt.instance;
@injectableInit
void configureInjection(String env) {
  getIt.init(environment: env);
}


