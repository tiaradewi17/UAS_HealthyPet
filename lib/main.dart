
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthypet/login/home.dart';
import 'package:healthypet/login/login2.dart';
import 'package:healthypet/screens/home_screen.dart';
import 'package:healthypet/screens/klinik_page.dart';
import 'package:healthypet/login/login.dart';
import 'package:healthypet/screens/splash_screen.dart';


FirebaseApp? app;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAGRk2cYN3xk-J8py2KV_11dJQXK56HYNM",
      appId: "1:242157431700:android:a8de6d9dd73fe95ddc7d81",
      messagingSenderId: "Messaging sender id here",
      projectId: "uas-healthypet",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
        //  home: klinik_page(),
    );
  }
}