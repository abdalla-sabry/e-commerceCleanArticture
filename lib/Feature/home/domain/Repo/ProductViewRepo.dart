import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import 'package:e_commerce_clean_arcitecture/core/failer/Failer.dart';
import '../../../../core/utiles/Getit.dart';
import '../../data/DataSource/Remote/product_Remote_Data_Source.dart';

abstract class ProductViewRepo {
  Future<Either<Failer, List<ProductEntites>>> featchProductModelHomeRepo();
}

class ProductViewRepoImpl extends ProductViewRepo {
  final ProductRemoteDataSourceImpl productRemoteDataSourceImpl ;
  ProductViewRepoImpl({required this.productRemoteDataSourceImpl});
  @override
  Future<Either<Failer, List<ProductEntites>>> featchProductModelHomeRepo() async {
    try {
      final result = await productRemoteDataSourceImpl.getProductes();
      return result; // simply return the Either<Failer, List<ProductEntites>>
    } on DioException catch (e) {
      return left(ApiFailure.fromTypeError(e));
    } catch (e) {
      return left(Failer(e.toString()));
    }
  }
}
