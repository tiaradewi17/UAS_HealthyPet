import 'package:flutter/material.dart';
import 'package:healthypet/models/doctor_model.dart';
import 'package:healthypet/screens/chat_detail.dart'; // Import kelas DoctorModel

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with Doctors"),
      ),
      body: _buildChatList(),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      itemCount: doctors.length, // Menggunakan daftar dokter dari DoctorModel
      itemBuilder: (context, index) {
        DoctorModel doctor = doctors[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/${doctor.image}'),
          ),
          title: Text(doctor.name),
          subtitle: Text("Last message here..."), // Tampilkan pesan terakhir di sini
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatDetail(doctor: doctor),
              ),
            );
            // Tindakan saat pengguna mengklik dokter tertentu (misalnya, membuka obrolan dengan dokter ini)
          },
        );
      },
    );
  }
}
