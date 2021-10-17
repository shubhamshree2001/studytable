import 'package:STUDYtable/models/subject.dart';
import 'package:STUDYtable/screens/physics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubjectItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subject = Provider.of<Subject>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            MyHomePage.routeName,
            arguments: subject.id,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.27,
            margin: const EdgeInsets.only(
              left: 2,
              bottom: 15.0,
              right: 2.0,
              top: 1.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(20.0, 10.0),
                  blurRadius: 20.0,
                ),
              ],
            ),

            //change to
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(subject.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  subject.title,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
