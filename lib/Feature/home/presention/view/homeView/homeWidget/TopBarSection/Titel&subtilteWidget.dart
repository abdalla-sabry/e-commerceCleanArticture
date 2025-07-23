import 'package:e_commerce_clean_arcitecture/Feature/authantication/domain/useCase/getuserDataUseCase.dart';
import 'package:e_commerce_clean_arcitecture/Feature/authantication/presention/mangment/getUserData/get_user_data_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/widget/snackBarText.dart';
import 'package:e_commerce_clean_arcitecture/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/utiles/Getit.dart';
import '../../../../../../../core/utiles/fontStyle.dart';
import '../../../../../../authantication/domain/Responce/getUserDataRepo.dart';


class Titel_subtiltewidget extends StatelessWidget {
  Titel_subtiltewidget({super.key, });

  String? fristNAme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
       if(state is GetUserDataSuccess ){

         return Padding(
           padding: EdgeInsets.only(left: 4.5.w, top: 5.5.h),

           child: Row(
             children: [
               Text(
                 '${state.userDataModel.firstName} ${state.userDataModel.lastName}',
                 style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w300),
               ),
             ],
           ),
         )
             ;
      }else if(state is GetUserDataFailure){

         SnackBarText.show(context: context, message:state.error);
         return Padding(
             padding: EdgeInsets.only(left: 4.5.w, top: 5.5.h),
             child:
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Welcome,',
                   style: styleText.TitleTextStyle,
                 ),
                 Text(
                   'E-Shop mobile store',
                   style: styleText.SubTitleTextStyle,
                 ),
               ],
             )) ;
       }
       else{
         return Padding(
             padding: EdgeInsets.only(left: 4.5.w, top: 5.5.h),
             child:
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Welcome,',
                   style: styleText.TitleTextStyle,
                 ),
                 Text(
                   'E-Shop mobile store',
                   style: styleText.SubTitleTextStyle,
                 ),
               ],
             )) ;

       }
    }
    );

  }
}
