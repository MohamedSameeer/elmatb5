import 'package:elmatb5/share/cubit/app-state.dart';
import 'package:elmatb5/share/themes/theme-manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppInitState());

  static AppCubit getInstance(context)=>BlocProvider.of(context);

  //Theme
  ThemeNotifier theme=ThemeNotifier();
  bool isDark=false;
  void changeTheme(){
    if(theme.getTheme()==theme.darkTheme)
      isDark=!isDark;
    emit(AppChangeThemeState());
  }

}