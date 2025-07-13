import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/orders/orders.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/usecase.dart';
import 'package:e_commerce_clean_arcitecture/core/failer/Failer.dart';

class FeatchOrdersUseCase extends UseCase<List<OrderDetiles> ,void>{
  @override
  Future<Either<Failer, List<OrderDetiles>>> call([void pramtier]) async {
    // TODO: implement call
    throw UnimplementedError();
  }
}