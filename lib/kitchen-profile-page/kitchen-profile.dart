import 'package:elmatb5/kitchen-profile-page/kitchen-profile-cubit.dart';
import 'package:elmatb5/kitchen-profile-page/kitchen-profile-state.dart';
import 'package:elmatb5/share/component/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class KitchenProfile extends StatelessWidget {
  const KitchenProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<KitchenProfileCubit>(
      create: (BuildContext context) => KitchenProfileCubit(),
      child: BlocConsumer<KitchenProfileCubit, KitchenProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
              child: Column(
                children: [
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/meal.png'),
                      fit: BoxFit.fill,
                    )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.0,
                        ),
                        circleImage(
                          width: 100,
                          height: 100,
                          image: NetworkImage(
                            'https://thumbs.dreamstime.com/b/cute-owl-vector-cartoon-high-detail-illustration-additional-format-eps-you-can-very-easy-edit-separate-layers-75640096.jpg',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Muhammed's Kitchen",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Follow",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person),
                                Text(" 8 Followers"),
                              ],
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Row(
                              children: [
                                Icon(Icons.motorcycle),
                                Text(" 8 Orders"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlutterToggleTab(
                    width: 90,
                    borderRadius: 10,
                    height: 50,
                    initialIndex: 4,
                    selectedIndex:
                        KitchenProfileCubit.getInstance(context).index,
                    selectedTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    unSelectedTextStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                    labels: [
                      'Well-cooked',
                      'Dessert',
                      'Pastry',
                      'semi-cooked',
                    ],
                    selectedLabelIndex: (index) {
                      KitchenProfileCubit.getInstance(context)
                          .toggleTabs(index);
                    },
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    width: 80.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image(
                                        image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjFsWCXZpHkgSm1NTvOGJFsrnza7-4h3miyg&usqp=CAU',
                                        ),
                                      ),
                                    ),
                                  ),
                                  iconText(icon: Icons.alarm, text: ' 30 Min '),
                                  iconText(
                                      icon: Icons.motorcycle_rounded,
                                      text: ' 1 Day '),
                                ],
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "حواوشي",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    Text(
                                      "20 EGP",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.add_shopping_cart),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Add to cart",
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 10.0,
                      ),
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
