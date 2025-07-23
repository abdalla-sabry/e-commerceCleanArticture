import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/failure/Failer.dart';
import '../../../../domain/use cases/cart/FeatchCartUsecase.dart';


part 'remove_card_items_state.dart';

class RemoveCardItemsCubit extends Cubit<RemoveCardItemsState> {
   CartUseCaseImpl removeProductResponseUseCase;

  RemoveCardItemsCubit({required this.removeProductResponseUseCase})
      : super(RemoveCardItemsInitial());

  Future<void> removeCardItem({
    required String uid,
    required String productId,
  }) async {
    emit(RemoveCardItemsLoading());

    final result = await removeProductResponseUseCase.removeProduct(
      uid: uid,
      productId: productId,
    );

    result.fold(
          (Failure failure) {
        emit(RemoveCardItemsFailure(error: failure.error!));
      },
          (_) {
        emit(RemoveCardItemsSuccess(massage: 'Item removed successfully'));
      },
    );
  }
}
