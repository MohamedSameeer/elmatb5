import 'package:elmatb5/share/cubit/app-cubit.dart';
import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, BuildContext context})
      : super(key: key, title: title, actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.brightness_2),
            onPressed: () {
               AppCubit.getInstance(context).changeTheme();
            },
          ),
        ]);
}
