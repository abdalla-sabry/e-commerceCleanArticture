import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widget/LoadingInducator.dart';
import '../../../mangement/catigory/catigory_cubit.dart';
import '../../../mangement/catigory/catigory_cubit.dart';
import 'CategoryCard.dart';

class Sliverchildbulder extends StatelessWidget {
  const Sliverchildbulder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatigoryCubit, CatigoryState>(
      builder: (context, state) {
        if (state is CatigorySuccess) {
          return Expanded(
            child: ListView.builder(
                itemCount: state.categoryList.length,
                itemBuilder: (BuildContext, index) {
                  return Categorycard(  categoryEntites: state.categoryList[index],);
                }),
          );

        } else if (state is CatigoryFailer) {
          if (state.error == "Internal Server Error – Something went wrong." ||
              state.error!.contains("500")) {
            return Image.asset(
              'assets/status_image/internal-server-error.png',
              width: MediaQuery.of(context).size.width * 0.7,
            );
          } else if (state.error == "No internet connection." ||
              state.error!.toLowerCase().contains("connection") ||
              state.error!.toLowerCase().contains("timeout")) {
            return Image.asset(
              'assets/status_image/no-connection.png',
              width: MediaQuery.of(context).size.width * 0.7,
            );
          } else {
            return Column(
              children: [
                Image.asset(
                  'assets/status_image/general-error.png',
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
                const SizedBox(height: 16),
                Text(
                  state.error!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            );}}

         else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
