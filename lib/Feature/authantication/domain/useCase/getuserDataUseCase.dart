import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/authantication/data/Models/userDataModel.dart';

import '../../../../core/failure/Failer.dart';
import '../../../home/domain/use cases/usecase.dart';
import '../Responce/getUserDataRepo.dart';

class GetuserdataUseCase extends UseCase<UserDataModel, String? > {
  final UserDataRepositoryImpl repository;
  GetuserdataUseCase(this.repository);

  @override
  Future<Either<Failure, UserDataModel>> call([ String? email]) async {
    return await repository.getUserData( email!);
  }
}
