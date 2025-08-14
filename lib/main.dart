import 'package:flutter/material.dart';
import 'package:flutter_treasure_hunt/providers/treasure_provider.dart';
import 'package:flutter_treasure_hunt/screens/treasure_hunt_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TreasureProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Treasure Hunt',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TreasureHuntScreen(),
    );
  }
}
