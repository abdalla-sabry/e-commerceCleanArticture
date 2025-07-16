import 'package:flutter_bloc/flutter_bloc.dart';

class Obseriver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} changed from ${change.currentState} to ${change.nextState}');
    super.onChange(bloc, change);
  }
}