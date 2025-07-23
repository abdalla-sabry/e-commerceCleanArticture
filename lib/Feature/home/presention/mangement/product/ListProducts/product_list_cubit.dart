import 'package:bloc/bloc.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/use%20cases/prodect/FeatchListprodectUseCases.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utiles/Getit.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit() : super(ProductListInitial());
  FeatchListProdectUseCases featchListProdectUseCases=getIt.get<FeatchListProdectUseCases>();
  getProductList()async{
    emit(ProductListLoading());
    var productList= await featchListProdectUseCases.call();
    productList.fold(
      (Failer) {
        emit(ProductListFailer(error: Failer.error??'the error unkwon'));
      },(productList) {
        emit(ProductListSuccess(productList: productList));
      },
    );
  }
}
