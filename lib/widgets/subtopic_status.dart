import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtopicStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  child: Text(
                    'Read',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  child: Text(
                    'Tough',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  child: Text(
                    'Revised',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
