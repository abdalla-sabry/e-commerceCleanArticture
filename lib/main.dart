import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/prodect/FeatchListprodectUseCases.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/product/ListProducts/product_list_cubit.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/observer.dart';
import 'package:e_commerce_clean_arcitecture/homeBody.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'Feature/home/presention/view/ItemDetiles/ItemDetilesView.dart';
import 'core/utiles/Getit.dart';
import 'core/utiles/theme.dart';
import 'firebase_options.dart';

void main() async {
  getITFuncationForproductConstractor();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=Obseriver();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context){
                 return ProductListCubit()..getProductList();
              })
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Homebody(),
              theme: AppTheme.lightTheme,
              routes: {
              },
            ),
          );
        }

    );
  }
}
