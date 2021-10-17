import 'package:STUDYtable/anim/custom_routes.dart';
import 'package:STUDYtable/screens/final.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepninja/nepninja.dart';

class AnimatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _navigate() {
      Navigator.of(context).pushReplacement(
        CustomRoute(
          builder: (ctx) => FinalPersonal(),
        ),
      );
    }

    void makeRequest(Function navigate) {
      Future.delayed(Duration(milliseconds: 2500), () {
        _navigate();
      });
    }

    var size = MediaQuery.of(context).size;

    return CircularProgressButton(
      height: size.height * 0.1,
      width: size.width * 0.7,
      borderRadius: 30,
      backgroundColor: Color(0xff6f35a5),
      fadeDurationInMilliSecond: 400,
      text: "Sign In",
      fontSize: MediaQuery.of(context).size.width * 0.06,
      progressIndicatorColor: Colors.white,
      onTap: (navigate) {
        makeRequest(navigate);
      },
    );
  }
}
