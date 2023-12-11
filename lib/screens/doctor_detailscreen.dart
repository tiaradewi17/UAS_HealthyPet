import 'package:flutter/material.dart';
import 'package:healthypet/models/doctor_model.dart';
import 'package:healthypet/screens/consultation.dart';
import 'colorSheme.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorModel doctor;

  DoctorDetailsScreen({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/${doctor.image}'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    doctor.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    doctor.services.join(', '),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            sectionTitle("About the Doctor"),
            GestureDetector(
              onTap: () {
                _navigateToConsultationSchedule(context, "13", "MAY", "Sunday",
                    "Consultation", "Sunday 9 am to 11.30 am");
              },
              child: timeSlotWidget(
                  "13", "MAY", "Consultation", "Sunday 9 am to 11.30 am"),
            ),
            // ... (bagian lain dari DoctorDetailsScreen)

            GestureDetector(
              onTap: () {
                _navigateToConsultationSchedule(context, "14", "MAY", "Monday",
                    "Consultation", "Monday 10 am to 12.30 am");
              },
              child: timeSlotWidget(
                  "14", "MAY", "Consultation", "Monday 10 am to 12.30 am"),
            ),

            GestureDetector(
              onTap: () {
                _navigateToConsultationSchedule(context, "1", "JUN",
                    "Wednesday", "Consultation", "Wednesday 8 am to 12.30 pm");
              },
              child: timeSlotWidget(
                  "1", "JUN", "Consultation", "Wednesday 8 am to 12.30 pm"),
            ),

            GestureDetector(
              onTap: () {
                _navigateToConsultationSchedule(context, "3", "JUN", "Friday",
                    "Consultation", "Friday 8 am to 1 am");
              },
              child: timeSlotWidget(
                  "3", "JUN", "Consultation", "Friday 8 am to 1 am"),
            ),
          ],
        ),
      ),
    );
  }

void _navigateToConsultationSchedule(BuildContext context, String date, String month, String day, String slotType, String time) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ConsultationScheduleScreen(
        date: '$date $month', // Menggabungkan tanggal dan bulan
        day: day, // Menggunakan hari
        // Kamu juga bisa meneruskan informasi lain yang diperlukan ke ConsultationScheduleScreen di sini
      ),
    ),
  );
}

  //       Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: Text(
  //           "Doctors are the only people who have a thorough understanding of all diseases, their symptoms, and their remedies. Doctors put forth all of their efforts and work day and night selflessly to ensure that society's health is maintained. Doctors, like soldiers, rarely take vacations",
  //           style: TextStyle(
  //             fontSize: 16,
  //           ),
  //         ),
  //       ),
  //       sectionTitle("Available Time Slots"),
  //       timeSlotWidget("13", "MAY", "Consultation", "Sunday 9 am to 11.30 am"),
  //       timeSlotWidget("14", "MAY", "Consultation", "Monday 10 am to 12.30 am"),
  //       timeSlotWidget("1", "JUN", "Consultation", "Wednesday 8 am to 12.30 pm"),
  //       timeSlotWidget("3", "JUN", "Consultation", "Friday 8 am to 1 am"),
  //     ],
  //   ),
  // ),
}

Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Container timeSlotWidget(
    String date, String month, String slotType, String time) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: docContentBgColor,
    ),
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: dateBgColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  date,
                  style: TextStyle(
                    color: dateColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  month,
                  style: TextStyle(
                    color: dateColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                slotType,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
