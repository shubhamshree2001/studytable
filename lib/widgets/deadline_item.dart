import 'package:STUDYtable/models/deadlines.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DeadlineItem extends StatelessWidget {
  const DeadlineItem({
    Key key,
    @required this.deadlines,
    @required this.deleteDl,
  }) : super(key: key);

  final Deadlines deadlines;
  final Function deleteDl;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                ),
                width: 100,
                height: 70,
                child: Center(
                  child: Text(DateFormat.MMMd().format(deadlines.date),
                      style: GoogleFonts.lato(
                        fontSize: 17,
                      )),
                ),
              ),
              Container(
                width: 150,
                child: Text(
                  '${deadlines.title}',
                  style: GoogleFonts.lato(
                    fontSize: 17,
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteDl(deadlines.id),
              ),
            ],
          ),
        ));
  }
}
