import 'package:chapter1/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  final imageURL =
      "https://media-exp1.licdn.com/dms/image/C5603AQEU_Ub9jKbLLg/profile-displayphoto-shrink_800_800/0/1628015305119?e=1641427200&v=beta&t=I9RF82FZUcbXsYRpm_p4FwN-G6V-nmeFpVqqiMISILs";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text('Ayush Santri'),
                accountEmail: Text('ayushsantri222@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageURL),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                'Email',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.fullscreen_exit,
                color: Colors.white,
              ),
              title: const Text(
                'Log Out',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
