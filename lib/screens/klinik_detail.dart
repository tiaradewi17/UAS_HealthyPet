import 'package:flutter/material.dart';
import 'package:healthypet/models/viewmodels/fetch_data_klinik.dart';

class KlinikDetailPage extends StatelessWidget {
  final dynamic klinikData;

  const KlinikDetailPage({Key? key, required this.klinikData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Klinik Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              klinikData.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              klinikData.name + " " + klinikData.phoneNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              klinikData.address,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            // Add more details here if needed
          ],
        ),
      ),
    );
  }
}
