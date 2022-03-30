import 'package:flutter/material.dart';

class ReceivePackage extends StatelessWidget {
  static const String id = 'receive_a_package';
  const ReceivePackage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Application'),
        backgroundColor: Colors.purple[900],
      ),
      body: const Center(child: Text('Receive a package page')),
    );
  }
}