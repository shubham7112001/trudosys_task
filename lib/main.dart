

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:trudosys/providers/home_screen_provider.dart';
import 'package:trudosys/screens/home_screen.dart';
void main() {
  runApp(
    ChangeNotifierProvider<HomeScreenProvider>(
      create: (context) => HomeScreenProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trudosys',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 127, 124, 131)),
        useMaterial3: true,
      ),
      home:  const HomeScreen(),
    );
  }
}