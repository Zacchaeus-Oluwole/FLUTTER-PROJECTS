import 'package:flutter/material.dart';
import 'package:notify_me/service/local_notification_service.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final LocalNotificationService service;

  @override
  void initState(){
    service = LocalNotificationService();
    service.initialize();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Notification"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'This is a demo of how to use local notification',
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await service.showNotification(
                        id: 0,
                        title: 'Notification Title',
                        body: 'Hi, This is to notify you that notification is working');
                    },
                    child: const Text('Show Local Notification')
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    child: const Text('Show Scheduled Notification')
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    child: const Text('Show Notification With Payload')
                  ),
                ],
              ),
            )),
          ),
      ),
    
    );
  }
}
