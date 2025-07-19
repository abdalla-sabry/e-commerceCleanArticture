import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/Repo/product/ProductViewRepo.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/usecase.dart';
import 'package:e_commerce_clean_arcitecture/core/failer/Failer.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/Getit.dart';

class FeatchListProdectUseCases extends UseCase<List<ProductEntites>,void>{
  @override
  ProductViewRepoImpl productViewRepoImpl ;
FeatchListProdectUseCases({required this.productViewRepoImpl});
  Future<Either<Failer, List<ProductEntites>>> call([void pramtier]) {
    return productViewRepoImpl.featchProductModelHomeRepo();
  }

}