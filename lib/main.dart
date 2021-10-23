import 'package:flutter/material.dart';
import 'package:guest_age/guess_teacher_age.dart';
import 'package:guest_age/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primarySwatch: Colors.blue,
      ),
      routes: {
        Guess.routeName: (context) => const Guess(),
        page.routeName: (context) => const page(),
      },
      initialRoute: '/guess',
    );
  }
}


