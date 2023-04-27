import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itschool/model/user_model.dart';
import 'package:itschool/screens/admin/inComponenet/AModule/divider.dart';

class AdminModuleScreen extends StatelessWidget {
  const AdminModuleScreen({
    Key? key,
    required this.loggedInUser,
    required this.title,
  }) : super(key: key);

  final UserModel loggedInUser;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            //Text('${loggedInUser.email}'),
            Text(title),
          ],
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(
                left: 10.0,
                right: 15.0,
              ),
              width: MediaQuery.of(context).size.width * 1,
              height: 379,
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  MyFeat(
                    loggedInUser: loggedInUser,
                    title: 'Add Module',
                    colour: Color(0xff00bfa5),
                    icon: Icons.add,
                  ),
                  MyFeat(
                    loggedInUser: loggedInUser,
                    title: 'Edit Module',
                    colour: Color(0xff00bfa5),
                    icon: Icons.edit,
                  ),
                  MyFeat(
                      loggedInUser: loggedInUser,
                      title: 'Delete Module',
                      colour: Color(0xff00bfa5),
                      icon: Icons.delete),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyFeat extends StatelessWidget {
  MyFeat(
      {required this.title,
      required this.icon,
      required this.colour,
      required this.loggedInUser});

  final String title;
  final IconData icon;
  final Color colour;
  final UserModel loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          if (title == "Add Module") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ModScreen(
                          ttle: title,
                          loggedInUser: loggedInUser,
                        )));
          } else if (title == "Edit Module") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ModScreen(
                          ttle: title,
                          loggedInUser: loggedInUser,
                        )));
          } else if (title == "Delete Module") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ModScreen(
                          ttle: title,
                          loggedInUser: loggedInUser,
                        )));
          }
        },
        splashColor: colour,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 50.0,
                color: Color(0xff0b3140),
              ),
              Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF3C4046),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
