import 'package:bloc/bloc.dart';
import 'package:e_commerce_clean_arcitecture/Feature/authantication/data/Models/userDataModel.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utiles/Getit.dart';
import '../../../domain/useCase/getuserDataUseCase.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(GetUserDataInitial());
  GetuserdataUseCase getuserdataUseCase=getIt.get<GetuserdataUseCase>();
  getUserDataFireBase({required String email})async{
   var UserData =await getuserdataUseCase.call(email);
   UserData.fold((failure){
     emit(GetUserDataFailure(error: failure.error!));
   }, (userDataModel) {
     emit(GetUserDataSuccess(userDataModel: userDataModel));
   },);
  }
}
