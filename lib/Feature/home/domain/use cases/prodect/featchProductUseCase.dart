import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/product.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/usecase.dart';
import 'package:e_commerce_clean_arcitecture/core/failer/Failer.dart';

class FeatchProductUseCase extends UseCase<Product,void>{
  @override
  Future<Either<Failer, Product>> call([void pramtier]) {
    // TODO: implement call
    throw UnimplementedError();
  }

}