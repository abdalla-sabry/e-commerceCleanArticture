import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/usecase.dart';
import 'package:e_commerce_clean_arcitecture/core/failer/Failer.dart';

import '../../entities/catigory/catigory.dart';

class FeatchCatigoryUseCase extends UseCase<Category,void>{
  @override
  Future<Either<Failer, Category>> call([void pramtier]) {
    // TODO: implement call
    throw UnimplementedError();
  }
}