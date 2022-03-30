import 'package:flutter/material.dart';

class SendPackage extends StatelessWidget {
  static const String id = 'send_a_package';
  const SendPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Application'),
        backgroundColor: Colors.purple[900],
      ),
      body: const Center(child: Text('Send a package page')),
    );
  }
}
