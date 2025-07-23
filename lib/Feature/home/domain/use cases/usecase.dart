import 'package:dartz/dartz.dart';

import '../../../../core/failure/Failer.dart';


abstract class UseCase<type,par>{
  Future<Either<Failure,type>>call([par pramtier]);
}