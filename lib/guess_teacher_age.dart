import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:guest_age/api.dart';

class Guess extends StatefulWidget {
  static const routeName = '/guess';
  const Guess({Key? key}) : super(key: key);

  @override
  _GuessState createState() => _GuessState();
}

class _GuessState extends State<Guess> {
  int year = 0;
  int month = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/h1.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TEACHER\'S AGE',
                  style: GoogleFonts.nosifer(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF800000),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    border: new Border.all(
                        color: Colors.black,
                        width: 5.0,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpinBox(
                        decoration: InputDecoration(labelText: 'YEAR'),
                        min: 1,
                        max: 100,
                        value: 0,
                        textStyle: GoogleFonts.nosifer(fontSize: 30),
                        onChanged: (value) {
                          year = value.toInt();
                          print(year);
                        },
                      ),
                      SpinBox(
                        decoration: InputDecoration(labelText: 'MONTH'),
                        min: 1,
                        max: 12,
                        value: 0,
                        textStyle: GoogleFonts.nosifer(fontSize: 30),
                        onChanged: (value) {
                          month = value.toInt();
                          print(month);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 26.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            onPressed: _handleClickButton,
                            child: Text(
                              'GUESS',
                              style: GoogleFonts.nosifer(
                                fontSize: 30,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          elevation: 5,
          backgroundColor: Colors.black87,
          title: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
          content: Text(msg, style: TextStyle(fontSize: 20,color: Colors.white)),
          actions: [
            TextButton(
              child: Text('OK',
                  style: GoogleFonts.nosifer(
                    fontSize: 30,
                    color: Colors.red,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _handleClickButton() async {
    var guess = await _login(year, month);

    if (guess['value'] == true) {
      Navigator.pushReplacementNamed(
        context,
        '/page',
        arguments: {'year': year,'month': month},
      );
    } else {
      _showMaterialDialog('ผลการทาย', '${guest['text']}');
    }
  }

  Future<dynamic> _login(int y, int m) async {
    try {
      var isLogin =
          (await Api().submit('guess_teacher_age', {'year': y, 'month': m}));
      print('LOGIN: $isLogin');
      return isLogin;
    } catch (e) {
      print(e);
      _showMaterialDialog('ERROR', e.toString());
      return null;
    }
  }
}
