import 'package:e_commerce_clean_arcitecture/Feature/authantication/presention/mangment/getUserData/get_user_data_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../mangement/CardItem/GetCardItems/get_card_items_cubit.dart';
import 'homeVeiw.dart';

class Homeveiwblocprovider extends StatefulWidget {
  const Homeveiwblocprovider({super.key});
  static const String routeName = 'Homeveiwblocprovider';

  @override
  State<Homeveiwblocprovider> createState() => _HomeveiwblocproviderState();
}

class _HomeveiwblocproviderState extends State<Homeveiwblocprovider> {
  @override

@override
  void initState() {
    final userEmail = FirebaseAuth.instance.currentUser!.email;

    BlocProvider.of<GetUserDataCubit>(context).getUserDataFireBase(email: userEmail!);    super.initState();
    final uid=FirebaseAuth.instance.currentUser!.uid;
    BlocProvider.of<GetCardItemsCubit>(context). fetchCardProducts(uid: uid);
  }
  @override
  Widget build(BuildContext context) {
    return Homeveiw();
  }
}
