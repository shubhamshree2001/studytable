import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  'STUDY',
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 15,
                        color: Colors.black45,
                        offset: Offset.fromDirection(120, 12),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'table',
                style: GoogleFonts.lato(
                  fontSize: 30,
                  shadows: <Shadow>[
                    Shadow(
                      blurRadius: 15,
                      color: Colors.black45,
                      offset: Offset.fromDirection(120, 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'CARE\t\t\t\t\t\t\t\t',
                style: GoogleFonts.lato(
                  fontSize: 10,
                  color: Colors.black54,
                ),
              ),
              Text(
                'A\t\t\t\t\t\t\t\t\t',
                style: GoogleFonts.lato(
                  fontSize: 10,
                  color: Colors.black54,
                ),
              ),
              Text(
                'SMILE',
                style: GoogleFonts.lato(
                  fontSize: 10,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
