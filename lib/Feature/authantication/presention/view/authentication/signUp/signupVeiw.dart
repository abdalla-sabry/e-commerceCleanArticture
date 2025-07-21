import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_clean_arcitecture/Feature/authantication/presention/mangment/SignUp/sign_up_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/authantication/presention/mangment/SignUp/sign_up_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/authantication/presention/view/authentication/singIn/signInView.dart';
import 'package:e_commerce_clean_arcitecture/Feature/widget/snackBarText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/utiles/constant/imagesConstante.dart';
import '../../../../../../core/utiles/validate.dart';
import '../../../../../widget/InputFormButton.dart';
import '../../../../../widget/InputTextFormField.dart';
import '../singIn/SingInVeiwBlocProvider.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  static const String routeName = 'signUp';
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          context.loaderOverlay.hide();
          SnackBarText.show(
            context: context,
            message: state.massage,
          );
          Future.delayed(Duration(milliseconds: 300), () {
            Navigator.pushNamed(context, Singinveiwblocprovider.routeName);
          });
        } else if (state is SignUpFailure) {
          SnackBarText.show(
            context: context,
            message: state.error,
          );
          context.loaderOverlay.hide();
        } else if (state is SignUpLoading) {
          context.loaderOverlay.show();
        }
      },
      child: LoaderOverlay(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 80,
                      child: Image.asset(
                        kAppLogo,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Please use your e-mail address to create a new account",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 6.h),
                    InputTextFormField(
                      controller: _firstNameController,
                      hint: 'First Name',
                    ),
                    const SizedBox(height: 12),
                    InputTextFormField(
                      controller: _lastNameController,
                      hint: 'Last Name',
                      textInputAction: TextInputAction.next,
                      validation: (String? val) =>
                          Validators.validateField(val, "Last name"),
                    ),
                    const SizedBox(height: 12),
                    InputTextFormField(
                      controller: _emailController,
                      hint: 'Email',
                      textInputAction: TextInputAction.next,
                      validation: (String? val) =>
                          Validators.validateEmail(val),
                    ),
                    const SizedBox(height: 12),
                    InputTextFormField(
                      controller: _passwordController,
                      hint: 'Password',
                      textInputAction: TextInputAction.next,
                      isSecureField: true,
                      validation: (String? val) =>
                          Validators.validateField(val, "Password"),
                    ),
                    const SizedBox(height: 12),
                    InputTextFormField(
                      controller: _confirmPasswordController,
                      hint: 'Confirm Password',
                      isSecureField: true,
                      textInputAction: TextInputAction.go,
                      validation: (String? val) =>
                          Validators.validatePasswordMatch(
                        val,
                        _passwordController.text,
                      ),
                    ),
                    const SizedBox(height: 24),
                    InputFormButton(
                      color: Colors.black87,
                      titleText: 'Sign Up',
                      onClick: () {
                        BlocProvider.of<SignUpCubit>(context).signUpFunction(
                            emailAddress: _emailController.text,
                            password: _passwordController.text,
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text);
                      },
                    ),
                    const SizedBox(height: 10),
                    InputFormButton(
                      color: Colors.black87,
                      onClick: () {
                        Navigator.of(context).pop();
                      },
                      titleText: 'Back',
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
