import 'package:elmatb5/home-page/home-screen.dart';
import 'package:elmatb5/login-page/login-screen.dart';
import 'package:elmatb5/profile-page/profile-screen.dart';
import 'package:elmatb5/share/component/component.dart';
import 'package:elmatb5/share/cubit/app-cubit.dart';
import 'package:elmatb5/share/network/local/storage-manager.dart';
import 'package:elmatb5/share/network/local/variable.dart';
import 'package:elmatb5/share/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppCubit cubit=AppCubit.getInstance(context);
    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppCubit.getInstance(context).isDark?drawerColorDarkMode.withOpacity(0.6):drawerColorLightMode.withOpacity(0.6),
        ),
        child: Drawer(
          child: ListView(
            padding:EdgeInsets.all(20.0) ,
            children: [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.fill,
                          )
                      ),
                    ),
                    Text("Mohamed Samir"),
                    SizedBox(height: 10.0,),
                    Text("MohamedSamir@gmail.com"),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.home,
                    color: selectedItem=="Home"?Colors.blueGrey:null,
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: selectedItem=="Home"?Colors.blueGrey:null,
                      ),
                    ),
                  ],
                ),
                onTap: (){
                  navigateTo(context, Home());
                  selectedItem="Home";
                },
                //selected: selectedItem=="Home",
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.account_circle,
                      color: selectedItem=="Profile"?Colors.blueGrey:null,),
                    SizedBox(width: 10.0,),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: selectedItem=="Profile"?Colors.blueGrey:null,
                      ),
                    ),
                  ],
                ),
                onTap: (){
                  navigateTo(context,Profile());
                  selectedItem="Profile";
                },
                //selected: selectedItem=='Profile',
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.account_balance_wallet,
                      color: selectedItem=="SentOrders"?Colors.blueGrey:null,),
                    SizedBox(width: 10.0,),
                    Text(
                      "Sent Orders",
                      style: TextStyle(
                        color: selectedItem=="SentOrders"?Colors.blueGrey:null,
                      ),
                    ),
                  ],
                ),
                onTap: (){
                  navigateTo(context, Home());
                  selectedItem="SentOrders";
                },
              //  selected: selectedItem=='SentOrders',
              ),
              Divider(),
              Text(
                "Communicate",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.share,
                      color: selectedItem=="Share"?Colors.blueGrey:null,),
                    SizedBox(width: 10.0,),
                    Text(
                      "Share",
                      style: TextStyle(
                        color: selectedItem=="Share"?Colors.blueGrey:null,
                      ),
                    ),
                  ],
                ),
                onTap: (){
                  navigateTo(context, Home());
                  selectedItem="Share";
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.contact_support,
                      color: selectedItem=="Support"?Colors.blueGrey:null,),
                    SizedBox(width: 10.0,),
                    Text(
                      "Support",
                      style: TextStyle(
                        color: selectedItem=="Support"?Colors.blueGrey:null,
                      ),
                    ),
                  ],
                ),
                onTap: (){
                  navigateTo(context, Home());
                  selectedItem="Support";
                },
                //selected: selectedItem=='Support',
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.logout,),
                    SizedBox(width: 10.0,),
                    Text(
                      "Logout",
                    ),
                  ],
                ),
                onTap: ()async{
                  await FirebaseAuth.instance.signOut();
                  StorageManager.deleteData('uId');
                  navigateAndFinish(context, Login());
                },
              ),
            ],
          ),
        )
    );
  }
}
