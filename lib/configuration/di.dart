import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/configuration/app_config.dart';
import 'package:sandbox/data/networks/dio/dio_builder.dart';
import 'package:sandbox/ui/routing/router.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
}

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => getIt.get<DioBuilder>().build(
        baseUrl: getIt.get<AppConfig>().apiBaseUrl,
      );

  @lazySingleton
  GoRouter get router => getIt.get<RouterBuilder>().build();
}
