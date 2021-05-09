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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Image.network(
                    'https://lh3.googleusercontent.com/proxy/UGb7WrUom1p1bmpKlUBxufxifTJZhhO9e-t2TseEMJ5TO7tIqwuwfUsXf8B2tzcY5Qy2aqGqOQMUwarXPft10jGc',
                      width: double.infinity,
                    height: 350.0,
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
