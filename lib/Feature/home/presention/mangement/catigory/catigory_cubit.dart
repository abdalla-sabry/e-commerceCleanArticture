import 'package:bloc/bloc.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/catigory/catigory.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/catigory/FeatchCatigoryUseCase.dart';
import 'package:e_commerce_clean_arcitecture/core/failer/Failer.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/Getit.dart';
import 'package:meta/meta.dart';

part 'catigory_state.dart';

class CatigoryCubit extends Cubit<CatigoryState> {
  CatigoryCubit() : super(CatigoryInitial());
  FeatchCatigoryUseCase featchCatigoryUseCase=getIt.get<FeatchCatigoryUseCase>();
  getCatigoryList()async{
    emit(CatigoryInitial());
    var catigoryList=await featchCatigoryUseCase.call();
    catigoryList.fold((Failer) {
      emit(CatigoryFailer(error: Failer.error));
    }, (catigoryList) {
      emit(CatigorySuccess(categoryList: catigoryList));
    },);
  }
}
