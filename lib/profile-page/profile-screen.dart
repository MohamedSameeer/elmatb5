import 'package:elmatb5/share/component/app-bar.dart';
import 'package:elmatb5/share/component/component.dart';
import 'package:elmatb5/share/component/drawer.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("Profile"),
        context: context,
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    child: Container(
                      width: double.infinity,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://media.cntraveler.com/photos/5f5fad3f7557491753644e3b/3:2/w_4050,h_2700,c_limit/50States50Cuisines-2020-AmberDay-Lede%20Option.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: circleImage(
                      width: 80,
                      height: 80,
                      image:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjFsWCXZpHkgSm1NTvOGJFsrnza7-4h3miyg&usqp=CAU'),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 50,
                      width: 40,
                      height:40,
                      child: CircleAvatar(
                        backgroundColor: Colors.lightBlueAccent,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                          ),
                          onPressed: () {

                          },

                        ),
                      ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              "Mohamed Samir",
                            style: Theme.of(context).textTheme.headline6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 20.0,),
                        TextButton(
                            onPressed: (){},
                            child: Text(
                              "Subscribe",
                            )
                        ),
                      ],
                    ),
                    Text(
                      "BIO HERE",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey[400]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height:10.0),
                    Row(
                      children: [
                        Icon(Icons.person ),
                        SizedBox(width:10.0,),
                        Text(
                          "0",
                        ),
                        SizedBox(width:10.0,),
                        Text(
                          "Followers",
                        ),
                        SizedBox(width: 20.0,),
                        Icon(Icons.fastfood ),
                        SizedBox(width:10.0,),
                        Text(
                          "0",
                        ),
                        SizedBox(width:10.0,),
                        Text(
                          "Orders",
                        ),
                      ],
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
