import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/CardItem/RemoveCardItems/remove_card_items_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/CardItem/addCardItems/add_card_items_cubit.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/observer.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/view/homeBody.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'Feature/authantication/presention/mangment/getUserData/get_user_data_cubit.dart';
import 'Feature/authantication/presention/view/authentication/singIn/SingInVeiwBlocProvider.dart';
import 'Feature/home/presention/mangement/CardItem/GetCardItems/get_card_items_cubit.dart';
import 'Feature/home/presention/mangement/CardItem/totilePrice/totile_prices_cubit.dart';
import 'Feature/home/presention/mangement/catigory/catigory_cubit.dart';
import 'Feature/home/presention/mangement/product/ListProducts/product_list_cubit.dart';
import 'core/utiles/BlocProviderList.dart';
import 'core/utiles/Getit.dart';
import 'core/utiles/routes.dart';
import 'core/utiles/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final user = FirebaseAuth.instance.currentUser;

  Bloc.observer = Obseriver();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  getITFuncationForproductConstractor();

  runApp(MyApp(
    user: user,
  ));
}

class MyApp extends StatelessWidget {
  final User? user;
  MyApp({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            return ProductListCubit()..getProductList();
          }),
          BlocProvider(create: (context) {
            return GetUserDataCubit();
          }),
          BlocProvider(create: (context) {
            return getIt.get<AddCardItemsCubit>();
          }),
          BlocProvider(create: (context) {
            return getIt.get<GetCardItemsCubit>();
          }),
          BlocProvider(create: (context) {
            return getIt.get<RemoveCardItemsCubit>();
          }),
          BlocProvider(create: (context) {
            return GetUserDataCubit();
          }),
          BlocProvider(create: (context) {
            return CatigoryCubit()..getCatigoryList();
          }),
          BlocProvider(create: (context) {
            return TotilePricesCubit();
          }),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: (user == null) ? Singinveiwblocprovider() : Homebody(),
          theme: AppTheme.lightTheme,
          routes: routeMap,
        ),
      );
    });
  }
}
