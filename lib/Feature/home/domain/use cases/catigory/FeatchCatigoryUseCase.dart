import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/Repo/catigory/catigoryRepo.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/usecase.dart';
import 'package:e_commerce_clean_arcitecture/core/failer/Failer.dart';

import '../../entities/catigory/catigory.dart';

class FeatchCatigoryUseCase extends UseCase<List<CategoryEntites>, void> {
  CatigoryRepoImpl catigoryRepoImpl;
  FeatchCatigoryUseCase({required this.catigoryRepoImpl});
  Future<Either<Failer,List< CategoryEntites>>> call([void pramtier]) {
return  catigoryRepoImpl.featchCarigoryModelHomeRepo();
  }
}
