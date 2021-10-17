import 'package:flutter/widgets.dart';

class SubjectData extends ChangeNotifier {
  String id;
  String subjectName;
  String topic;
  List<dynamic> subtopic;

  SubjectData({
    this.id,
    this.subjectName,
    this.topic,
    this.subtopic,
  });
}
