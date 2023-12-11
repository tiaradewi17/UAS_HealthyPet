import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:healthypet/login/login2.dart';
import 'package:healthypet/screens/chat.dart';
import 'package:healthypet/screens/favorit_pet.dart';

var selectedService = 0;
var menus = [
  FeatherIcons.home,
  FeatherIcons.menu,
  FeatherIcons.messageCircle,
  FeatherIcons.user
];
var selectedMenu = 0;

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Container(
        // Your main content
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context) =>
      BottomNavigationBar(
        selectedItemColor: const Color(0xFF818AF9),
        type: BottomNavigationBarType.fixed,
        items: menus
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e), label: e.toString()))
            .toList(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: const Color(0xFFBFBFBF),
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoritPet(),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Chat(),
              ),
            );
          }
        },
      );

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        // Action when the button is pressed
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blue, // Set the desired background color
      elevation: 2.0,
    );
  }
}
