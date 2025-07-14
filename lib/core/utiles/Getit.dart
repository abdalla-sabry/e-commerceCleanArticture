import 'package:dio/dio.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/data/DataSource/Remote/product_Remote_Data_Source.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/ApiSerice.dart';
import 'package:get_it/get_it.dart';

import '../../Feature/home/domain/Repo/ProductViewRepo.dart';
import '../../Feature/home/domain/use cases/prodect/FeatchListprodectUseCases.dart';

final getIt = GetIt.instance;

void getITFuncationForproductConstractor() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<Api_Service>(Api_Service(dio: getIt.get<Dio>()));
  getIt.registerSingleton<ProductRemoteDataSourceImpl>(
      ProductRemoteDataSourceImpl(api_service: getIt.get<Api_Service>()));
  getIt.registerSingleton<ProductViewRepoImpl>(ProductViewRepoImpl(
      productRemoteDataSourceImpl: getIt.get<ProductRemoteDataSourceImpl>()));
  getIt.registerSingleton<FeatchListProdectUseCases>(FeatchListProdectUseCases(
      productViewRepoImpl: getIt.get<ProductViewRepoImpl>()));

  }
