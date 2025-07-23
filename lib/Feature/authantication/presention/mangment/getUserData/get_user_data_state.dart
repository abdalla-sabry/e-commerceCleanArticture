part of 'get_user_data_cubit.dart';

@immutable
abstract class GetUserDataState {}

 class GetUserDataInitial extends GetUserDataState {}
 class GetUserDataLoading extends GetUserDataState {}
 class GetUserDataSuccess extends GetUserDataState {
  UserDataModel userDataModel;
  GetUserDataSuccess({required this.userDataModel});
 }
 class GetUserDataFailure extends GetUserDataState {
  String error;
  GetUserDataFailure({required this.error});
 }
