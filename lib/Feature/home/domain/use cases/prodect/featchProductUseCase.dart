import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/usecase.dart';

import '../../../../../core/failure/Failer.dart';

class FeatchProductUseCase extends UseCase<ProductEntites,void>{
  @override
  Future<Either<Failure, ProductEntites>> call([void pramtier]) {
    // TODO: implement call
    throw UnimplementedError();
  }

}