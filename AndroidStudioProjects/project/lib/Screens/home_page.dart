import 'package:flutter/material.dart';
import 'package:project/Constants/reusable_button.dart';
import 'package:project/Constants/reusable_text.dart';
import 'package:project/Screens/receive_a_package.dart';
import 'package:project/Screens/send_a_package.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Application'),
        backgroundColor: Colors.purple[900],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.purple[900],
                      child: const Icon(
                        Icons.info_sharp,
                        size: 35,
                      ),
                    ),
                    Container(
                      height: 50,
                      color: Colors.purple[900],
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'What to send',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Image(
              width: 300,
              height: 300,
              image: AssetImage('images/image.png'),
            ),
          ),
          const ReusableText(
            text: 'Send Packages with',
            size: 30,
            weight: FontWeight.bold,
            colour: Colors.black,
          ),
          const ReusableText(
            text: 'Connect',
            size: 30,
            weight: FontWeight.bold,
            colour: Colors.black,
          ),
          const ReusableText(
            text: 'Get deliverd in the time it takes to drive',
            size: 18.0,
            weight: FontWeight.normal,
            colour: Colors.grey,
          ),
          const ReusableText(
            text: 'there',
            size: 18.0,
            weight: FontWeight.normal,
            colour: Colors.grey,
          ),
          const SizedBox(height: 20.0),
          ReusableButton(
            text: 'Send a package',
            function: () {
              Navigator.pushNamed(context, SendPackage.id);
            },
          ),
          const SizedBox(height: 20.0),
          ReusableButton(
            text: 'Receive a package',
            function: () {
              Navigator.pushNamed(context, ReceivePackage.id);
            },
          ),
          const SizedBox(height: 20.0),
          ReusableButton(
            text: 'Make a call',
            function: () async {
              launch('tel://');
            },
          ),
        ],
      ),
    );
  }
}
