import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/data/Models/catigory/carigoryModel.dart';
import 'package:e_commerce_clean_arcitecture/core/failer/Failer.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/ApiSerice.dart';

abstract class Catigory_Reomote_Data_Sourse {
  Future< Either<Failer,List<Carigorymodel>>>getCatigory() ;
}
class Catigory_Reomote_Data_SourseImpl extends Catigory_Reomote_Data_Sourse{
   Api_Service api_service;
   Catigory_Reomote_Data_SourseImpl({required this.api_service});
  @override

  Future<Either<Failer, List<Carigorymodel>>> getCatigory() async{
    try {
      final response = await api_service.getResponse(endPoint: 'categories');

      final List<dynamic> dataList = response['data'];

      List<Carigorymodel> catigores =[];
      for (var item in dataList) {
        catigores.add(Carigorymodel.fromJson(item));
      }
      return Right(catigores);
    } on DioException catch (e) {
      return left(ApiFailure.fromTypeError(e));
    }
  }
}