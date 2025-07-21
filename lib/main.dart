import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/prodect/FeatchListprodectUseCases.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/catigory/catigory_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/product/ListProducts/product_list_cubit.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/observer.dart';
import 'package:e_commerce_clean_arcitecture/homeBody.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'Feature/authantication/presention/view/authentication/signUp/signUpVeiwBlocProvider.dart';
import 'Feature/authantication/presention/view/authentication/signUp/signupVeiw.dart';
import 'Feature/authantication/presention/view/authentication/singIn/SingInVeiwBlocProvider.dart';
import 'Feature/authantication/presention/view/authentication/singIn/signInView.dart';
import 'Feature/home/presention/view/ItemDetiles/ItemDetilesView.dart';
import 'core/utiles/Getit.dart';
import 'core/utiles/theme.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final user =FirebaseAuth.instance.currentUser;

  Bloc.observer=Obseriver();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  getITFuncationForproductConstractor();


  runApp(MyApp(user: user,));
}

class MyApp extends StatelessWidget {
  User?user;

  MyApp({super.key,required this.user });
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context){
                 return ProductListCubit()..getProductList();
              }),BlocProvider(create: (context){
                 return CatigoryCubit()..getCatigoryList();
              }),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home:user!=null? Homebody():Singinveiwblocprovider(),
              theme: AppTheme.lightTheme,
              routes: {
                SignUpView.routeName: (context) => SignUpView(),
                Singinveiwblocprovider.routeName: (context) => Singinveiwblocprovider(),
                SignupVeiwBlocProvider.routeName: (context) => SignupVeiwBlocProvider(),
                Homebody.routeName: (context) => Homebody(),
              },
            ),
          );
        }

    );
  }
}
