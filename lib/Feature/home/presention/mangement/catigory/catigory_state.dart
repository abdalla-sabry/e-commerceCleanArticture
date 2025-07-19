part of 'catigory_cubit.dart';

@immutable
abstract class CatigoryState {}

 class CatigoryInitial extends CatigoryState {}
 class CatigoryLoading extends CatigoryState {}
 class CatigoryFailer extends CatigoryState {
   final String? error;

   CatigoryFailer({required this.error});
 }
 class CatigorySuccess extends CatigoryState {
  List<CategoryEntites>categoryList;
  CatigorySuccess({required this.categoryList});
 }
