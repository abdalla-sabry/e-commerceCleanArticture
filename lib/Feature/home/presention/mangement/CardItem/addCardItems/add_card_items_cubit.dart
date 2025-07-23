import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/data/Models/cart/CartModel.dart';
import '../../../../../../core/failure/Failer.dart';
import '../../../../domain/use cases/cart/FeatchCartUsecase.dart';

part 'add_card_items_state.dart';

class AddCardItemsCubit extends Cubit<AddCardItemsState> {
  CartUseCaseImpl addProductResponseUseCase;

  AddCardItemsCubit({required this.addProductResponseUseCase})
      : super(AddCardItemsInitial());

  Future<void> addProductToCart({
    required ProductCardModel product,
    required String uid,
  }) async {
    emit(AddCardItemsLoading());

    final result = await addProductResponseUseCase.addProduct(product: product, uid: uid);

    result.fold(
          (Failure failure) {
        emit(AddCardItemsFailure(error: failure.error));
      },
          (_) {
        emit(AddCardItemsSuccess(massage: "Product added successfully"));
      },
    );
  }
}
