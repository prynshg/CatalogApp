import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl="https://media.licdn.com/dms/image/D4D03AQHMDPXA7FYvNg/profile-displayphoto-shrink_800_800/0/1668437292334?e=1678320000&v=beta&t=mQo-25BpMEhs1WAKrNgnc5QyrfbzyfLwvrm-xk8ruq8";
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.amber),
                accountName: Text("Priyansh",style: TextStyle(color: Colors.black),),
                accountEmail: Text("priyanshgarg309@gmail.com",style: TextStyle(color: Colors.black)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
          ),
          ListTile(
            leading: Icon(
                CupertinoIcons.home,
                color: Colors.black,
            ),
            title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),
            ),
          ),
           ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.black,
            ),
            title: Text(
              "Profile",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.black,
            ),
            title: Text(
              "Email",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
