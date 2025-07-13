import 'package:dio/dio.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/ApiSerice.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
getIt.registerSingleton<Dio>(Dio());
getIt.registerSingleton<Api_Service>(Api_Service( dio: getIt.get<Dio>()));
}