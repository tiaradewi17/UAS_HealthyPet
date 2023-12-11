import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthypet/services/firebase_auth_service.dart';
import 'login.dart';

class ProfilePage extends StatelessWidget {
  final FirebaseAuthService _authService = FirebaseAuthService();

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _authService.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = _authService.getCurrentUser();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        color: Color(0xFF818AF9),
        child: currentUser != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      // You can add a user profile image here
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://awsimages.detik.net.id/community/media/visual/2023/09/02/kucing-ragdoll_169.jpeg?w=600&q=90'), // Example image URL
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Email:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${currentUser.email ?? "No email"}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () => _showLogoutConfirmationDialog(context),
                      child: Text('Logout'),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text('No user is currently logged in.'),
              ),
      ),
    );
  }
}
