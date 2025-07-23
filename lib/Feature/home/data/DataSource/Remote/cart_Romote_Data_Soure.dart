import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure/Failer.dart';
import '../../Models/cart/CartModel.dart';

abstract class CardRomoteDataSource {
  Future<Either<Failure, void>> AddProductes({
    required ProductCardModel productCardmodel,
    required String uid,
  });

  Future<Either<Failure, void>> RemoveProductes({
    required String productIndex,
    required String uid,
  });

  Future<Either<Failure, List<ProductCardModel>>> getProductesCardModel({
    required String uid,
  });
}

class CardRemoteDataSourceImpl extends CardRomoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, void>> AddProductes({
    required ProductCardModel productCardmodel,
    required String uid,
  }) async {
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('products')
          .add(productCardmodel.toMap());

      return const Right(0);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure.fromFirebaseException(e));
    } catch (e) {
      return Left(FirebaseFailure.fromUnknown(e));
    }
  }

  @override
  Future<Either<Failure, void>> RemoveProductes({
    required String productIndex,
    required String uid,
  }) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('products')
          .where('id', isEqualTo: productIndex)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return Left(FirebaseFailure('No product found with id: $productIndex'));
      }

      // Assuming 'id' is unique, delete the first match
      await querySnapshot.docs.first.reference.delete();

      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure.fromFirebaseException(e));
    } catch (e) {
      return Left(FirebaseFailure.fromUnknown(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductCardModel>>> getProductesCardModel({
    required String uid,
  }) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(uid)
          .collection('products')
          .get();

      final products = snapshot.docs
          .map((doc) => ProductCardModel.fromMap(doc.data()))
          .toList();

      return Right(products);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure.fromFirebaseException(e));
    } catch (e) {
      return Left(FirebaseFailure.fromUnknown(e));
    }
  }
}
