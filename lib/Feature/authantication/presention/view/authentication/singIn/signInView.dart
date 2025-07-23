import 'package:e_commerce_clean_arcitecture/Feature/authantication/presention/mangment/signIn/sign_in_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/view/homeBody.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../mangment/getUserData/get_user_data_cubit.dart';

import '../../../../../../core/utiles/constant/imagesConstante.dart';
import '../../../../../../core/utiles/validate.dart';
import '../../../../../widget/InputFormButton.dart';
import '../../../../../widget/InputTextFormField.dart';
import '../../../../../widget/snackBarText.dart';
import '../signUp/signUpVeiwBlocProvider.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            context.loaderOverlay.hide();
            SnackBarText.show(
              context: context,
              message: state.message,
            );
            final userEmail = FirebaseAuth.instance.currentUser!.email;

            BlocProvider.of<GetUserDataCubit>(context).getUserDataFireBase(email: userEmail!);
            Future.delayed(Duration(milliseconds: 300), () {
              Navigator.pushNamed(context, Homebody.routeName,
                  arguments: state.user.email);
            });
          } else if (state is SignInFailure) {
            SnackBarText.show(
              context: context,
              message: state.error,
            );
            context.loaderOverlay.hide();
          } else if (state is SignInLoading) {
            context.loaderOverlay.show();
          }
        },
        child: LoaderOverlay(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                          height: 80,
                          child: Image.asset(
                            kAppLogo,
                            color: Colors.black,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Please enter your e-mail address and password to sign-in",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      InputTextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        hint: 'Email',
                        validation: (String? val) =>
                            Validators.validateField(val, "Email"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InputTextFormField(
                        controller: passwordController,
                        textInputAction: TextInputAction.go,
                        hint: 'Password',
                        isSecureField: true,
                        validation: (String? val) =>
                            Validators.validateField(val, "Password"),
                        onFieldSubmitted: (_) => {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, AppRouter.forgotPassword);
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      InputFormButton(
                        color: Colors.black87,
                        onClick: () {
                          BlocProvider.of<SignInCubit>(context).signIn(
                              email: emailController.text,
                              password: passwordController.text);
                        },
                        titleText: 'Sign In',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputFormButton(
                        color: Colors.black87,
                        onClick: () {
                          Navigator.of(context).pop();
                        },
                        titleText: 'Back',
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account! ',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SignupVeiwBlocProvider.routeName);
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
