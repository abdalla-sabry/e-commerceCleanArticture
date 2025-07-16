import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'total_check_state.dart';

class TotalCheckCubit extends Cubit<TotalCheckState> {
  TotalCheckCubit() : super(TotalCheckInitial());
}
