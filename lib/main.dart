import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNo) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNo.wav'));
  }

  Expanded buildKey({required int soundNo, required Color color}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () async {
          playSound(soundNo);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(soundNo: 1, color: Colors.red),
              buildKey(soundNo: 2, color: Colors.orange),
              buildKey(soundNo: 3, color: Colors.yellow),
              buildKey(soundNo: 4, color: Colors.green),
              buildKey(soundNo: 5, color: Colors.teal),
              buildKey(soundNo: 6, color: Colors.blue),
              buildKey(soundNo: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}