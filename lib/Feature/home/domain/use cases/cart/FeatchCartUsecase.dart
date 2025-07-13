import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/usecase.dart';
import 'package:e_commerce_clean_arcitecture/core/failer/Failer.dart';
import 'package:flutter/material.dart';

import '../../entities/cart/cart.dart';

class FeatchCartUseCase extends UseCase<List<ProductItem>,void>{
  @override
  Future<Either<Failer, List<ProductItem>>> call([void pramtier]) {
    // TODO: implement call
    throw UnimplementedError();
  }
}