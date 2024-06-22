import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AutoPark extends StatefulWidget {
  const AutoPark({super.key});

  @override
  State<AutoPark> createState() => _AutoParkState();
}

class _AutoParkState extends State<AutoPark> {
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> sendCommand(String command) async {
    final response =
    await http.get(Uri.parse('http://192.168.43.213/$command'));
    print('Response: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff89b5e1),
      body: Center(
        child:Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: MaterialButton(
            onPressed: () {
              sendCommand('Autopark');
              sendNotifications();
            },
            child: Text(
              'Auto Park',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),


      ),
    );
  }
}

void sendNotifications() {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'Parking Notifications',
          title: 'Auto Park',
          body: 'Your car will park soon...',
          ));
}