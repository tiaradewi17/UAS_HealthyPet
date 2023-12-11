import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Kucing'),
      ),
      body: Container(
        color: Color(0xFF818AF9), // Warna latar belakang ungu
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/cat_avatar.jpg'), // Ganti dengan gambar avatar kucing
            ),
            SizedBox(height: 20.0),
            Text(
              'Nama Kucing: Whiskers',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Warna teks putih
              ),
            ),
            Text(
              'Jenis: Kucing Persia',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white, // Warna teks putih
              ),
            ),
            Text(
              'Umur: 2 Tahun',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white, // Warna teks putih
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'Email: whiskers@example.com',
                style: TextStyle(color: Colors.white), // Warna teks putih
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'Nomor Telepon: +1 123-456-7890',
                style: TextStyle(color: Colors.white), // Warna teks putih
              ),
            ),
          ],
        ),
      ),
    );
  }
}
