import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'service.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: APIServices.fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(100.0),
                    child: Column(
                      children: [
                        Image.network(snapshot.data![index].avatar!),
                        Text(snapshot.data![index].firstName!),
                        Text(snapshot.data![index].lastName!),
                        Text(snapshot.data![index].email!),
                      ],
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
