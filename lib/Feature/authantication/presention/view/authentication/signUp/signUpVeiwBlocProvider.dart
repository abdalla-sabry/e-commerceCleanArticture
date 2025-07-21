import 'package:e_commerce_clean_arcitecture/Feature/authantication/presention/mangment/SignUp/sign_up_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/authantication/presention/view/authentication/signUp/signupVeiw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupVeiwBlocProvider extends StatelessWidget {
  const SignupVeiwBlocProvider({super.key});
static const String routeName='SignupVeiwBlocProvider';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
    return  SignUpCubit();
    },child: SignUpView(),);
  }
}
