import 'package:flutter/material.dart';

class ConsultationScheduleScreen extends StatelessWidget {
  final String date;
  final String day;

  ConsultationScheduleScreen({required this.date, required this.day});

  // Contoh jadwal konsultasi dokter
  List<String> doctorSchedule = [
    'Dr. Smith - 9:00 AM',
    'Dr. Johnson - 10:30 AM',
    'Dr. Williams - 1:00 PM',
    // Tambahkan jadwal dokter lain jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultation Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Date: $date',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Day: $day',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Doctor Schedule:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Menampilkan daftar jadwal konsultasi dokter
            Expanded(
              child: ListView.builder(
                itemCount: doctorSchedule.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      doctorSchedule[index],
                      style: TextStyle(fontSize: 18),
                    ),
                    // Tambahkan aksi jika diperlukan saat item diklik
                    onTap: () {
                      // Tambahkan aksi untuk menampilkan detail jadwal konsultasi dokter
                      // Misalnya, tampilkan dialog dengan detail jadwal dokter yang dipilih
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Doctor Schedule'),
                            content: Text('Detail schedule for ${doctorSchedule[index]}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.purple[50], // Mengatur warna dasar layar
    );
  }
}
