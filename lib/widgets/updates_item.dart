import 'package:STUDYtable/screens/update_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatesItem extends StatefulWidget {
  final String id;
  final String title;
  final String content;

  UpdatesItem({this.id, this.title, this.content});

  @override
  _UpdatesItemState createState() => _UpdatesItemState();
}

class _UpdatesItemState extends State<UpdatesItem> {
  void selectPost(BuildContext context) {
    Navigator.of(context).pushNamed(UpdatesDetailScreen.routeName, arguments: {
      'postId': widget.id,
    }).then((result) => {if (result != null) {}});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => selectPost(context),
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              padding: EdgeInsets.all(12.0),
              width: MediaQuery.of(context).size.width * 0.92,
              height: MediaQuery.of(context).size.height * 0.20,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Text(
                      widget.title,
                      style: GoogleFonts.lato(
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.all(10),
                    child: Text(
                      widget.content,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    ),
                  ),
                  Align(
                    child: Text(
                      'Read More >>>',
                      style: GoogleFonts.lato(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
