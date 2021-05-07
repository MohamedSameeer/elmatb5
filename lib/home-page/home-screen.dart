import 'dart:ui';

import 'package:elmatb5/share/component/app-bar.dart';
import 'package:elmatb5/share/component/component.dart';
import 'package:elmatb5/share/component/drawer.dart';
import 'package:elmatb5/share/cubit/app-cubit.dart';
import 'package:elmatb5/share/style/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text("Home"),context: context),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40.0,
                    width: double.infinity,
                    child: searchTextField(
                        textType: TextInputType.text,
                        hint: "Search for a meal...",
                        prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(width: 10.0,),
                MaterialButton(
                  child:Icon(Icons.restaurant_menu) ,
                onPressed: (){},
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Text(
              'check our main food categories :)',
              style: TextTheme().subtitle1,
            ),
            SizedBox(height:10.0),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    
                    child: Column(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Container(
                            padding:EdgeInsets.all(20.0),
                            width: double.infinity,
                            child: Text(
                              "Well cooked",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color:Colors.lightBlueAccent
                               /* image: DecorationImage(
                                  image: AssetImage('assets/images/meal.png'),
                                )*/
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding:EdgeInsets.all(20.0),
                            width: double.infinity,
                            child: Text(
                              "pastry",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              color: Colors.lightBlue
                               /* image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/meal.png'),
                                )*/
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            padding:EdgeInsets.all(20.0),
                            child: Text(
                              "semi-cooked",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.blueAccent,
                               /* image: DecorationImage(
                                  image: AssetImage('assets/images/meal.png'),
                                )*/
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        Expanded(
                          flex: 7,
                          child: Container(
                            width: double.infinity,
                            padding:EdgeInsets.all(20.0),
                            child: Text(
                              "desert",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.blue,
                                /*image: DecorationImage(
                                  image: AssetImage('assets/images/meal.png'),
                                )*/
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
