import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/pages/expanded_flexible_page.dart';
import 'package:flutter_application_1/views/pages/welcome_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageeState();
}

class _ProfilePageeState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('assets/images/bg.jpg'),
          ),
          ListTile(
            title: Text("Logout"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomePage();
                  },
                ),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
            
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
            ),
            child: ListTile(
              title: Text("Setting"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpandedFlexiblePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
