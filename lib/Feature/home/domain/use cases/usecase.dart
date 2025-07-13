import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_arcitecture/core/failer/Failer.dart';


abstract class UseCase<type,par>{
  Future<Either<Failer,type>>call([par pramtier]);
}