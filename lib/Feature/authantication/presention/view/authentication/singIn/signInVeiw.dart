import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/utiles/constant/imagesConstante.dart';
import '../../../../../widget/InputTextFormField.dart';

class signInVeiw extends StatelessWidget {
  const signInVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
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
          height: 10,
        ),
        const Text(
          "Please use your e-mail address to crate a new account",
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 6.h,
        ),
        InputTextFormField(
          controller: _firstNameController,
          hint: 'First Name',

        ),
        const SizedBox(
          height: 12,
        ),
        InputTextFormField(
          controller: _lastNameController,
          hint: 'Last Name',
          textInputAction: TextInputAction.next,
          validation: (String? val) =>
              Validators.validateField(val, "Last name"),
        ),
        const SizedBox(
          height: 12,
        ),
        InputTextFormField(
          controller: _emailController,
          hint: 'Email',
          textInputAction: TextInputAction.next,
          validation: (String? val) => Validators.validateEmail(val),
        ),
        const SizedBox(
          height: 12,
        ),
        InputTextFormField(
          controller: _passwordController,
          hint: 'Password',
          textInputAction: TextInputAction.next,
          isSecureField: true,
          validation: (String? val) =>
              Validators.validateField(val, "Password"),
        ),
        const SizedBox(
          height: 12,
        ),
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
          onFieldSubmitted: (_) => _onSignUp(context),
        ),
        const SizedBox(
          height: 24,
        ),
        InputFormButton(
          color: Colors.black87,
          onClick: () => _onSignUp(context),
          titleText: 'Sign Up',
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
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
