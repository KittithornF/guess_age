import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guest_age/guess_teacher_age.dart';

class page extends StatelessWidget {
  static const routeName = '/page';
  const page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var age = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GUESS TEACHER\'S AGE',
          style: GoogleFonts.nosifer(),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.7],
                  colors: <Color>[Colors.red.shade900, Colors.black])),
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'อายุอาจารย์',
                style: GoogleFonts.nosifer(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Text(
                '${age['year']} ปี ${age['month']} เดือน',
                style: GoogleFonts.nosifer(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Icon(
                Icons.check,
                size: 100,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
