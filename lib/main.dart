import 'package:flutter/material.dart';

import 'views/one_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Native state management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OnePage());
  }
}
