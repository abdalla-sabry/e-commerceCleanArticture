import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/authantication/data/Models/userDataModel.dart';
import '../../../../../core/failure/Failer.dart';

abstract class UserDataRemoteDataSource {
  Future<Either<Failure, UserDataModel>> getUserDataRemote(String email);
}

class UserDataRemoteDataSourceImpl extends UserDataRemoteDataSource {
  @override
  Future<Either<Failure, UserDataModel>> getUserDataRemote(String email) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userData = querySnapshot.docs.first.data();
        final firstName = userData['first_name'] as String?;
        final lastName = userData['last_name'] as String?;

        if (firstName != null && lastName != null) {
          return Right(UserDataModel(firstName: firstName, lastName: lastName));
        } else {
          return Left(FirebaseFailure("Missing user name fields"));
        }
      } else {
        return Left(FirebaseFailure("No user found with this email."));
      }
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure.fromFirebaseException(e));
    } catch (e) {
      return Left(FirebaseFailure.fromUnknown(e));
    }
  }
}
