import 'package:elmatb5/kitchen-profile-page/kitchen-profile.dart';
import 'package:elmatb5/share/component/app-bar.dart';
import 'package:elmatb5/share/component/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Kitchens extends StatelessWidget {
  String category;
  List listOfKitchens;
  Kitchens({Key key, @required this.category, @required this.listOfKitchens})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("Kitchens"),
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 40.0,
                child: searchTextField(
                  textType: TextInputType.text,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Top rated kitchens",
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120.0,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            InkWell(
                          onTap: () {
                            navigateTo(context, KitchenProfile());
                          },
                          child: Column(
                            children: [
                              circleImage(
                                width: 60.0,
                                height: 60.0,
                                image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjFsWCXZpHkgSm1NTvOGJFsrnza7-4h3miyg&usqp=CAU',
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: 70,
                                child: Text(
                                  "Mohamed Samir",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          width: 20.0,
                        ),
                        itemCount: 10,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                category,
                style: Theme.of(context).textTheme.headline5,
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {
                          navigateTo(context, KitchenProfile());
                        },
                        child: Card(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.0),
                                width: 100.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjFsWCXZpHkgSm1NTvOGJFsrnza7-4h3miyg&usqp=CAU',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mohamed Samir",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RatingBar.builder(
                                      ignoreGestures: true,
                                      itemSize: 20.0,
                                      initialRating: 3,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      }),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  iconText(
                                      icon: Icons.person, text: "10 Followers"),
                                  iconText(
                                      icon: Icons.motorcycle,
                                      text: " 8 Orders"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                        height: 10.0,
                      ),
                  itemCount: 10),
            ],
          ),
        ),
      ),
    );
  }
}
