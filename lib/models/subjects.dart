import 'dart:convert';

import 'package:STUDYtable/models/subject.dart';
import 'package:STUDYtable/models/subjectData.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Subjects with ChangeNotifier {
  List<Subject> _items = [];
  List<SubjectData> _topics = [];
  // List<String> l = [];
  Future<void> fetchSubjects(String standard) async {
    var url =
        'https://1ujmi7w5wl.execute-api.ap-south-1.amazonaws.com/SubjectData/subjectdata/$standard';

    print("HELlo fetchSubjects");
    try {
      final response = await http.get(url);

      // Map<String, Map<String, dynamic>> map = json.decode(response.body);
      final extractedData = json.decode(response.body);

      print(extractedData['ComputerScience']);
      final List<SubjectData> loadedSubjects = [];
      (extractedData as Map<String, dynamic>).forEach((mainKey, value) {
        if (mainKey != "class") {
          (extractedData[mainKey] as Map<String, dynamic>)
              .forEach((key, value) {
            loadedSubjects.add(SubjectData(
                subjectName: mainKey,
                subtopic: (value as Map<String, dynamic>)['subtopic'],
                topic: (value as Map<String, dynamic>)['name']));
          });
        }
      });
      print(loadedSubjects[0].subjectName);

//to display subjects on final.dart page
      extractedData.forEach((key, value) => {
            _items.add(Subject(
              id: 's3',
              title: key,
              imageUrl: 'lib/assets/images/mathsnew.png',
            )),
          });

      notifyListeners();
    } catch (error) {
      // throw (error);
      print(error);
    }
  }

  List<Subject> get items {
    return [..._items];
  }

  Subject findById(String id) {
    return _items.firstWhere((sub) => sub.id == id);
  }

  void addSubject() {
    notifyListeners();
  }
}
