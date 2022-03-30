import 'package:flutter/material.dart';
import 'package:project/Screens/home_page.dart';
import 'package:project/Screens/receive_a_package.dart';
import 'package:project/Screens/send_a_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        SendPackage.id: (context) => const SendPackage(),
        ReceivePackage.id: (context) => const ReceivePackage(),
      },
      home: const HomePage(),
    );
  }
}

