// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Los extends StatefulWidget {
  final TextStyle stilo;
  const Los({Key? key, required this.stilo}) : super(key: key);

  @override
  _LosState createState() => _LosState();
}

class _LosState extends State<Los> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70)),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Hola'),
          ),
          body: Center(
              child: Column(
            children: [
              const Text('Hola'),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Row(
                      children: [
                        Text('presioname'),
                        Icon(
                          Icons.people_alt,
                          color: Colors.yellow,
                        )
                      ],
                    )),
              )
            ],
          )),
        ));
  }
}
