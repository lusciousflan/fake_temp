import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int heinetu = 365, taion = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("体温捏造"),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (text) {
              heinetu = int.parse(text);
            },
          ),
          const Spacer(),
          ElevatedButton(onPressed: () {
            setState(() {
              var rand = math.Random();
              //debugPrint('${rand.nextInt(5)-2}');
              taion = rand.nextInt(5)-2;
            });
          }, child: const Text('今日の体温は？', style: TextStyle(fontSize: 50))),
          const Spacer(),
          Text('${(heinetu+taion)/10.0}', style: const TextStyle(fontSize: 150),),
          const Spacer(),
        ],
      ),
    );
  }
}