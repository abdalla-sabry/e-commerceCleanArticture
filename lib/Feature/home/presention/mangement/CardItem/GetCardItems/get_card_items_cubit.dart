import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/failure/Failer.dart';
import '../../../../data/Models/cart/CartModel.dart';
import '../../../../domain/use cases/cart/FeatchCartUsecase.dart';


part 'get_card_items_state.dart';

class GetCardItemsCubit extends Cubit<GetCardItemsState> {
  CartUseCaseImpl getProductResponseUseCase;

  GetCardItemsCubit({required this.getProductResponseUseCase})
      : super(GetCardItemsInitial());

  Future<void> fetchCardProducts({required String uid}) async {
    emit(GetCardItemsLoading());

    final result = await getProductResponseUseCase.getProducts(uid: uid);

    result.fold(
          (Failure failure) {
        emit(GetCardItemsFailure(error: failure. error! ));
      },
          (List<ProductCardModel> productCardList) {
        emit(GetCardItemsSuccess(productCardList: productCardList));
      },
    );
  }
}
