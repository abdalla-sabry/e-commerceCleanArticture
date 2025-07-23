import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/usecase.dart';

import '../../../../../core/failure/Failer.dart';
import '../../entities/DeliverInfo/deliveryInfo.dart';

class FeatchDeliverInfoUseCase extends UseCase<List<DeliveryInfo>,void>{
  @override
  Future<Either<Failure, List<DeliveryInfo>>> call([void pramtier]) {
    // TODO: implement call
    throw UnimplementedError();
  }
}