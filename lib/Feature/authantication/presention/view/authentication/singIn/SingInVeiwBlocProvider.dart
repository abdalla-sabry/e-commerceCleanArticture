import 'package:e_commerce_clean_arcitecture/Feature/authantication/presention/view/authentication/singIn/signInView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../mangment/signIn/sign_in_cubit.dart';

class Singinveiwblocprovider extends StatelessWidget {
  const Singinveiwblocprovider({super.key});
  static const String routeName = 'signIn';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      return  SignInCubit();
    },child: SignInView(),);
    }

}
