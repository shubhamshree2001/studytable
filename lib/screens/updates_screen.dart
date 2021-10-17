import 'package:STUDYtable/widgets/updates_item.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class UpdatesScreen extends StatefulWidget {
  @override
  _UpdatesScreenState createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: DUMMY_POSTS
            .map(
              (updatesData) => UpdatesItem(
                id: updatesData.id,
                title: updatesData.title,
                content: updatesData.content,
              ),
            )
            .toList(),
      ),
    );
  }
}
