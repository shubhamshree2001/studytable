import 'package:STUDYtable/models/deadlines.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'deadline_item.dart';

class DeadlineList extends StatelessWidget {
  final List<Deadlines> deadlines;
  final Function deleteDl;

  DeadlineList(this.deadlines, this.deleteDl);

  @override
  Widget build(BuildContext context) {
    return deadlines.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Deadlines Set Yet!',
                    style: GoogleFonts.lato(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('lib/assets/images/waiting.png'),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return DeadlineItem(
                  deadlines: deadlines[index], deleteDl: deleteDl);
            },
            // scrollDirection: Axis.horizontal,
            itemCount: deadlines.length,
            itemExtent: 100,
          );
  }
}
