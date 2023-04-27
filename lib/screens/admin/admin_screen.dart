import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itschool/model/user_model.dart';
import 'package:itschool/screens/admin/components/adHomeBody.dart';
import 'package:itschool/logIn/login_screen.dart';
import 'package:itschool/screens/admin/inComponenet/Chat/adminChat_Divider.dart';
import 'package:itschool/screens/admin/sidebar/navigation_drawer_widget.dart';

class AdminHome extends StatefulWidget {
  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  int currentIndex = 0;

  final screens = [
    ABody(),
    ChScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: Builder(
              builder: (context) => IconButton(
                    onPressed: () {
                      setState(() {
                        Scaffold.of(context).openDrawer();
                      });
                    },
                    icon: SvgPicture.asset("assets/icons/menu.svg"),
                  )),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ]),
      drawer: NavigationDrawerWidget(),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //backgroundColor: Colors.white54,
        selectedItemColor: Color(0xff0b3140),
        unselectedItemColor: Color(0xff384c54),
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Forum',
          ),
        ],
      ),
    );
  }
}
