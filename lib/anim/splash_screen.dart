import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final newStudent = new StudentData(
    id: null,
    name: null,
    email: null,
    mobile: null,
    username: null,
    goal: null,
    subjects: null,
  );
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToLogin();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(seconds: 3), () {});

    return true;
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => LoginScreenBody(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.715,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'STUDY',
                      style: TextStyle(
                          fontSize:
                              (MediaQuery.of(context).size.width * 10) / 100,
                          color: Colors.white),
                    ),
                    new TextSpan(
                      text: 'table',
                      style: new TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize:
                            (MediaQuery.of(context).size.width * 18) / 100,
                        color: Colors.white.withAlpha(255),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CARE',
                    style: GoogleFonts.lato(
                      fontSize: (MediaQuery.of(context).size.width * 4) / 100,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'A',
                    style: GoogleFonts.lato(
                      fontSize: (MediaQuery.of(context).size.width * 4) / 100,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'SMILE',
                    style: GoogleFonts.lato(
                      fontSize: (MediaQuery.of(context).size.width * 4) / 100,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
