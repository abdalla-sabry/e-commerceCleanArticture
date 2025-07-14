import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/data/Models/product/productModel.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import 'package:e_commerce_clean_arcitecture/core/failer/Failer.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/ApiSerice.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failer, List<ProductEntites>>> getProductes();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final Api_Service api_service;

  ProductRemoteDataSourceImpl({required this.api_service});

  @override
  Future<Either<Failer, List<ProductEntites>>> getProductes() async {
    try {
      final response = await api_service.getResponse(endPoint: 'products');

      final List<dynamic> dataList = response['data'];

      List<ProductModel> products =[];
      for (var item in dataList) {
        products.add(ProductModel.fromJson(item));
      }
      return Right(products);
    } on DioException catch (e) {
      return left(ApiFailure.fromTypeError(e));
    }
  }
}
