import 'package:STUDYtable/models/updates.dart';
import 'package:STUDYtable/widgets/updates_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Updates> favoritePosts;
  FavoritesScreen(this.favoritePosts);

  @override
  Widget build(BuildContext context) {
    if (favoritePosts.isEmpty) {
      return Center(
        child: Text('You have no favourites yet - start adding some'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return UpdatesItem(
            id: favoritePosts[index].id,
            title: favoritePosts[index].title,
            content: favoritePosts[index].content,
          );
        },
        itemCount: favoritePosts.length,
      );
    }
  }
}
