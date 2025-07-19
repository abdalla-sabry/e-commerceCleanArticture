part of 'total_check_cubit.dart';

@immutable
abstract class TotalCheckState {}

 class TotalCheckInitial extends TotalCheckState {}
 class TotalCheckAdding extends TotalCheckState {
 num addPrise;
 TotalCheckAdding(this.addPrise);
 }

