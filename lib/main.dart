import 'package:elmatb5/home-page/home-screen.dart';
import 'package:elmatb5/login-page/login-cubit.dart';
import 'package:elmatb5/login-page/login-screen.dart';
import 'package:elmatb5/share/component/state-observer.dart';
import 'package:elmatb5/share/cubit/app-cubit.dart';
import 'package:elmatb5/share/network/local/storage-manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'share/cubit/app-state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await StorageManager.init();

  //login handling
  Widget widget;
  if(StorageManager.readString('uId')!=null)
    widget=Home();
  else
    widget=Login();

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({Key key, this.startWidget}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
            create: (BuildContext context) => LoginCubit()),
        BlocProvider<AppCubit>(create: (BuildContext context) => AppCubit()),
      ],
      child: BlocConsumer<AppCubit,AppState>(
        listener: (BuildContext context, state) {
        },
        builder: (BuildContext context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: AppCubit.getInstance(context).isDark?ThemeMode.dark:ThemeMode.light,
          home: startWidget,
        ),
      ),
    );
  }
}
