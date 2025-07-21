part of 'sign_in_cubit.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
 final String message;
 User user;
 SignInSuccess({required this.message,required this.user});
}

class SignInFailure extends SignInState {
 final String error;

 SignInFailure({required this.error});
}
