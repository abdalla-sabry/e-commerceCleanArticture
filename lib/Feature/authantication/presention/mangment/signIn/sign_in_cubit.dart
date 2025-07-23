import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    try {
   UserCredential credential=   await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInSuccess(message: 'Signed in successfully.',user: credential.user!));

    } on FirebaseAuthException catch (e) {
      String errorMsg;
      if (e.code == 'user-not-found') {
        errorMsg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMsg = 'Incorrect password.';
      } else {
        errorMsg = e.message ?? 'An error occurred.';
      }
      emit(SignInFailure(error: errorMsg));
    } catch (e) {
      emit(SignInFailure(error: 'Error: ${e.toString()}'));
    }
  }
}
