import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/Repo/product/ProductViewRepo.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/usecase.dart';

import '../../../../../core/failure/Failer.dart';

class FeatchListProdectUseCases extends UseCase<List<ProductEntites>,void>{
  @override
  ProductViewRepoImpl productViewRepoImpl ;
FeatchListProdectUseCases({required this.productViewRepoImpl});
  Future<Either<Failure, List<ProductEntites>>> call([void pramtier]) {
    return productViewRepoImpl.featchProductModelHomeRepo();
  }

}