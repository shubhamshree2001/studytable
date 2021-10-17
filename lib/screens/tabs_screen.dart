import 'package:STUDYtable/models/updates.dart';
import 'package:STUDYtable/screens/favorites_screen.dart';
import 'package:STUDYtable/screens/updates_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsScreen extends StatefulWidget {
  final List<Updates> favoritePosts;
  // final String id;
  // final String title;
  // final String content;
  // final List<Updates> availablePost;

  TabsScreen(
    this.favoritePosts,
    // this.id,
    // this.title,
    // this.content,
    // this.availablePost,
  );

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages; //edit
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': UpdatesScreen(),
        'title': 'News and Updates',
      },
      {
        'page': FavoritesScreen(widget.favoritePosts),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5e1ff),
      appBar: AppBar(
        backgroundColor: Color(0xfff5e1ff),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            // ignore: deprecated_member_use
            title: Text('All'),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            // ignore: deprecated_member_use
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
