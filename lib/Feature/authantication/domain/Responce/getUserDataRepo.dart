// File: user_data_repository_impl.dart

import 'package:dartz/dartz.dart';

import '../../../../core/failure/Failer.dart';
import '../../data/Models/userDataModel.dart';
import '../../data/dataSource/remote/User_FireBase_Remote_Data_Source.dart';
abstract class UserDataRepository {
  Future<Either<Failure, UserDataModel>>  getUserData(String email) ;

  }


class UserDataRepositoryImpl implements UserDataRepository {
  final UserDataRemoteDataSource remoteDataSource;

  UserDataRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserDataModel>> getUserData(String email) async {
    final result = await remoteDataSource.getUserDataRemote(email);

    return result.fold(
          (failure) => Left(failure),
          (userDataModel) => Right(userDataModel), // Ensure UserDataModel has a toEntity() method
    );
  }
}
