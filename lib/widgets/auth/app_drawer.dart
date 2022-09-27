import 'package:flutter/material.dart';
import 'package:zolatte/screens/home_screen.dart';
import '../../screens/auth_screen.dart';
import '../../screens/deletePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatelessWidget {
  // const AppDrawer({Key key}) : super(key: key);
  static int c = 0;
  Future<void> poping(BuildContext context) async {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          backgroundColor: Color(0xFF2661FA),
          title: Text(
            'Hello Zolatte!',
            style: TextStyle(
                color: Color.fromARGB(255, 246, 244, 244),
                fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.delete_forever),
          title: Text('Delete',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DeletePage()),
            );
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Logout',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17)),
          onTap: () async {
            if (c == 0) {
              FirebaseAuth.instance.signOut();
            } else {
              Navigator.of(context).pop();
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(context,
                      AuthScreen.routeName, (Route<dynamic> route) => false));
            }
          },
        ),
      ]),
    );
  }
}
