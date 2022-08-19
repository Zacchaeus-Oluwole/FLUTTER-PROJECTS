import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(XyloPage(),
  );
}

// ignore: use_key_in_widget_constructors
class XyloPage extends StatelessWidget {
  void playSound(int soundNumber){
    final player = AudioCache();

    // call this method when desired
    player.play('note$soundNumber.wav');

  }
  
  Expanded buildXylo({ required Color color , required int soundNumber }){
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundNumber);
        }, child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildXylo(color: Colors.red, soundNumber: 1),
              buildXylo(color: Colors.orange, soundNumber: 2),
              buildXylo(color: Colors.yellow, soundNumber: 3),
              buildXylo(color: Colors.green, soundNumber: 4),
              buildXylo(color: Colors.teal, soundNumber: 5),
              buildXylo(color: Colors.blue, soundNumber: 6),
              buildXylo(color: Colors.purple, soundNumber: 7),
            ],
          ),
        )
      ),
    );
  }
}