import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[600],
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'NEWS',
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                  Text(
                    '19',
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180.0),
              child: Text(
                'Welcom to News19 app where you get the latest interactive news.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: RaisedButton(
                onPressed: () {},
                child: const Text(
                  'Enabled Button',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
