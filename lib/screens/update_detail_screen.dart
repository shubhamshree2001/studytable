import 'package:STUDYtable/dummy_data.dart';
import 'package:STUDYtable/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatesDetailScreen extends StatefulWidget {
  static const routeName = '/update-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  UpdatesDetailScreen(
    this.toggleFavorite,
    this.isFavorite,
  );

  @override
  _UpdatesDetailScreenState createState() => _UpdatesDetailScreenState();
}

class _UpdatesDetailScreenState extends State<UpdatesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final postId = routeArguments['postId'];

    final selectedPost = DUMMY_POSTS.firstWhere((post) => post.id == postId);

    return Scaffold(
      key: key,
      backgroundColor: Color(0xfff5e1ff),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          selectedPost.title,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xfff5e1ff),
        elevation: 0,
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 10, 15, 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 15),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    child: Text(
                      selectedPost.title,
                      style: GoogleFonts.lato(
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.7,
                  //   child: Divider(
                  //     thickness: 2,
                  //     color: Colors.black38,
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    child: Text(
                      selectedPost.subtitle,
                      style: GoogleFonts.lato(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 15),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(25),
                    child: Image.asset(selectedPost.image),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 20),
                    child: Text(
                      selectedPost.content,
                      style: GoogleFonts.lato(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: FooterSection(),
              height: MediaQuery.of(context).size.height * 0.15,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          widget.isFavorite(postId)
              ? Icons.bookmark
              : Icons.bookmark_border_sharp,
        ),
        onPressed: () {
          setState(() {
            widget.toggleFavorite(postId);
          });

          widget.isFavorite(postId)
              ? key.currentState.showSnackBar(
                  new SnackBar(
                    content: new Text('Added to favorites'),
                  ),
                )
              : key.currentState.showSnackBar(
                  new SnackBar(
                    content: new Text('Removed From Favorites'),
                  ),
                );
        },
      ),
    );
  }
}
