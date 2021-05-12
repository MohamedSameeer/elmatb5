import 'package:bloc/bloc.dart';
import 'package:elmatb5/kitchen-profile-page/kitchen-profile-state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KitchenProfileCubit extends Cubit<KitchenProfileStates> {
  KitchenProfileCubit() : super(KitchenProfileInitState());
  static KitchenProfileCubit getInstance(BuildContext context) =>
      BlocProvider.of(context);

  //change toggle tabs
  int index = 0;
  void toggleTabs(int index) {
    this.index = index;
    emit(KitchenProfileToggleState());
  }
}
