import 'package:flutter/material.dart';
import 'package:validuscoin/network/database.dart';
import 'package:validuscoin/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) => MyDatabase(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const HomeScreen(),
      ),
    );
  }
}
