import 'package:elmatb5/share/cubit/app-state.dart';
import 'package:elmatb5/share/network/local/storage-manager.dart';
import 'package:elmatb5/share/themes/theme-manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppInitState());

  static AppCubit getInstance(context)=>BlocProvider.of(context);

  //Theme
  bool isDark=StorageManager.readBool('isDark')==null?false:StorageManager.readBool('isDark');
  void changeTheme(){
    isDark=!isDark;
    ThemeManager().setThemeMode(isDark).then((value){
      emit(AppChangeThemeState());
    });

  }

}