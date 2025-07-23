import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/data/Models/cart/CartModel.dart';
import '../../../../../core/failure/Failer.dart';
import '../../../data/DataSource/Remote/cart_Romote_Data_Soure.dart';

abstract class CardRepository {
  Future<Either<Failure, void>> addProductResponse({required ProductCardModel product, required String uid});
  Future<Either<Failure, void>> removeProductResponse({required String productId, required String uid});
  Future<Either<Failure, List<ProductCardModel>>> getProductsResponse({required String uid});
}

class CartRepositoryImpl extends CardRepository {
  CardRemoteDataSourceImpl remote;

  CartRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, void>> addProductResponse({
    required ProductCardModel product,
    required String uid,
  }) async {
    return await remote.AddProductes(
      productCardmodel: product,
      uid: uid,
    );
  }

  @override
  Future<Either<Failure, void>> removeProductResponse({
    required String productId,
    required String uid,
  }) async {
    return await remote.RemoveProductes(
      productIndex: productId,
      uid: uid,
    );
  }

  @override
  Future<Either<Failure, List<ProductCardModel>>> getProductsResponse({
    required String uid,

  }) async {
    final result = await remote.getProductesCardModel(
   uid: uid,
    );

    return result.fold(
          (failure) => Left(failure),
          (_) async {
        final productsResult = await remote.getProductesCardModel(uid: uid);
        return productsResult;
      },
    );
  }

}
