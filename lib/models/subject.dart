import 'package:flutter/widgets.dart';

class Subject extends ChangeNotifier {
  final String id;
  final String imageUrl;
  final String title;

  Subject({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  });
}
