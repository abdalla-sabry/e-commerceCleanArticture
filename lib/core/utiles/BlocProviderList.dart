import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Feature/authantication/presention/mangment/getUserData/get_user_data_cubit.dart';
import '../../Feature/home/presention/mangement/catigory/catigory_cubit.dart';
import '../../Feature/home/presention/mangement/product/ListProducts/product_list_cubit.dart';

List <BlocProvider>blocProviderList=[
  BlocProvider(create: (context) {
    return ProductListCubit()..getProductList();
  }),
  BlocProvider(create: (context) {
    return GetUserDataCubit();
  }),
  BlocProvider(create: (context) {
    return CatigoryCubit()..getCatigoryList();
  }),
];