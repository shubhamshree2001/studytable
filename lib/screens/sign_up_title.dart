import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.08,
                color: Colors.black),
            text: 'STUDY',
          ),
          TextSpan(
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.15,
                color: Colors.black),
            text: 'table',
          ),
        ],
      ),
    );
  }
}
