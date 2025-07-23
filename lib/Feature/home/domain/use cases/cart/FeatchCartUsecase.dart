import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/data/Models/cart/CartModel.dart';
import '../../../../../core/failure/Failer.dart';
import '../../Repo/card/CardRepo.dart';

abstract class CartUseCase {
  Future<Either<Failure, void>> addProduct({required ProductCardModel product, required String uid});
  Future<Either<Failure, void>> removeProduct({required String productId, required String uid});
  Future<Either<Failure, List<ProductCardModel>>> getProducts({required String uid});
}

class CartUseCaseImpl extends CartUseCase {
   CardRepository repository;

  CartUseCaseImpl({required this.repository});

  @override
  Future<Either<Failure, void>> addProduct({required ProductCardModel product, required String uid}) {
    return repository.addProductResponse(product: product, uid: uid);
  }

  @override
  Future<Either<Failure, void>> removeProduct({required String productId, required String uid}) {
    return repository.removeProductResponse(productId: productId, uid: uid);
  }

  @override
  Future<Either<Failure, List<ProductCardModel>>> getProducts({required String uid}) {
    return repository.getProductsResponse(uid: uid);
  }
}
