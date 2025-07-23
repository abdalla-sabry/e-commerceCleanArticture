import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  signUpFunction(
      {required String emailAddress,
      required String password,
      required String firstName,
      required String lastName}) async {
    emit(SignUpLoading());
    try {

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final uid = credential.user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'first_name': firstName,
        'last_name': lastName,
        'email': emailAddress,
        'created_at': FieldValue.serverTimestamp(),
        'total_Price':0.0,
        'total_items':0
      });

      emit(SignUpSuccess(massage: "User data saved to Firestore." ));
    } on FirebaseAuthException catch (e) {

      if (e.code == 'weak-password') {
        emit(SignUpFailure(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(error: 'The account already exists for that email.'));
      }
    } catch (e) {

      print('Error during signup: $e'); // <-- ADD THIS LINE

      emit(SignUpFailure(error: e.toString()));
    }
  }
}
