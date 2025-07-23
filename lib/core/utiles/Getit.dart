import 'package:dio/dio.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/data/DataSource/Remote/product_Remote_Data_Source.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/ApiSerice.dart';
import 'package:get_it/get_it.dart';

import '../../Feature/authantication/data/dataSource/remote/User_FireBase_Remote_Data_Source.dart';
import '../../Feature/authantication/domain/Responce/getUserDataRepo.dart';
import '../../Feature/authantication/domain/useCase/getuserDataUseCase.dart';
import '../../Feature/home/data/DataSource/Remote/Catigory_Romote_Data_Soure.dart';
import '../../Feature/home/domain/Repo/catigory/catigoryRepo.dart';
import '../../Feature/home/domain/Repo/product/ProductViewRepo.dart';
import '../../Feature/home/domain/use cases/catigory/FeatchCatigoryUseCase.dart';
import '../../Feature/home/domain/use cases/prodect/FeatchListprodectUseCases.dart';

final getIt = GetIt.instance;

void getITFuncationForproductConstractor() {
  //Product Constractor
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<Api_Service>(
    Api_Service(dio: getIt.get<Dio>()),
  );
  getIt.registerSingleton<ProductRemoteDataSourceImpl>(
    ProductRemoteDataSourceImpl(api_service: getIt.get<Api_Service>()),
  );
  getIt.registerSingleton<ProductViewRepoImpl>(
    ProductViewRepoImpl(
        productRemoteDataSourceImpl: getIt.get<ProductRemoteDataSourceImpl>()),
  );
  getIt.registerSingleton<FeatchListProdectUseCases>(
    FeatchListProdectUseCases(
        productViewRepoImpl: getIt.get<ProductViewRepoImpl>()),
  );

  //Catigory Constractor
  getIt.registerSingleton<Catigory_Reomote_Data_SourseImpl>(
    Catigory_Reomote_Data_SourseImpl(
      api_service: getIt.get<Api_Service>(),
    ),
  );
  getIt.registerSingleton<CatigoryRepoImpl>(
    CatigoryRepoImpl(
      catigory_reomote_data_sourse:
          getIt.get<Catigory_Reomote_Data_SourseImpl>(),
    ),
  );
  getIt.registerSingleton<FeatchCatigoryUseCase>(
    FeatchCatigoryUseCase(catigoryRepoImpl: getIt.get<CatigoryRepoImpl>()),
  );

  //FireBase GetUserData Constractor
  getIt.registerSingleton<UserDataRemoteDataSourceImpl>(
    UserDataRemoteDataSourceImpl(),
  );
  getIt.registerSingleton<UserDataRepositoryImpl>(
    UserDataRepositoryImpl(getIt.get<UserDataRemoteDataSourceImpl>()),
  );
  getIt.registerSingleton<GetuserdataUseCase>(
    GetuserdataUseCase(getIt.get<UserDataRepositoryImpl>()),
  );
}
