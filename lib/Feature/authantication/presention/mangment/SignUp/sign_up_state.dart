part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

 class SignUpInitial extends SignUpState {}
 class SignUpLoading extends SignUpState {}
 class SignUpSuccess extends SignUpState {
   String massage;

   SignUpSuccess({required this.massage});
 }
 class SignUpFailure extends SignUpState {
  String error;
  SignUpFailure({required this.error});
 }
