import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/data/DataSource/Remote/Catigory_Romote_Data_Soure.dart';

import '../../../../../core/failer/Failer.dart';
import '../../../data/Models/catigory/carigoryModel.dart';

abstract class Catigory_Repo {
  Future<Either<Failer, List<Carigorymodel>>> featchCarigoryModelHomeRepo();
}

class CatigoryRepoImpl extends Catigory_Repo {
  @override
  Catigory_Reomote_Data_Sourse catigory_reomote_data_sourse;
  CatigoryRepoImpl({required this.catigory_reomote_data_sourse});
  Future<Either<Failer, List<Carigorymodel>>>
      featchCarigoryModelHomeRepo() async {
    try {
      final result = await catigory_reomote_data_sourse.getCatigory();
      return result;
    } on DioException catch (e) {
      return left(ApiFailure.fromTypeError(e));
    } catch (e) {
      return left(Failer(e.toString()));
    }
  }
}
