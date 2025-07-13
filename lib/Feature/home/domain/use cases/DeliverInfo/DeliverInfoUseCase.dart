import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/usecase.dart';
import 'package:e_commerce_clean_arcitecture/core/failer/Failer.dart';

import '../../entities/DeliverInfo/deliveryInfo.dart';

class FeatchDeliverInfoUseCase extends UseCase<List<DeliveryInfo>,void>{
  @override
  Future<Either<Failer, List<DeliveryInfo>>> call([void pramtier]) {
    // TODO: implement call
    throw UnimplementedError();
  }
}