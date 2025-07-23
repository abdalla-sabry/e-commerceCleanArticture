import 'package:flutter/cupertino.dart';

import '../../Feature/authantication/presention/view/authentication/signUp/signUpVeiwBlocProvider.dart';
import '../../Feature/authantication/presention/view/authentication/signUp/signupVeiw.dart';
import '../../Feature/authantication/presention/view/authentication/singIn/SingInVeiwBlocProvider.dart';
import '../../Feature/home/presention/view/homeView/HomeVeiwBlocProvider.dart';
import '../../Feature/home/presention/view/homeBody.dart';

Map<String, Widget Function(BuildContext)> routeMap = {
  SignUpView.routeName: (context) => SignUpView(),
  Singinveiwblocprovider.routeName: (context) => Singinveiwblocprovider(),
  SignupVeiwBlocProvider.routeName: (context) => SignupVeiwBlocProvider(),
  Homebody.routeName: (context) => Homebody(),
  Homeveiwblocprovider.routeName: (context) => Homeveiwblocprovider(),
};
