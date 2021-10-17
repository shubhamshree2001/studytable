import 'package:STUDYtable/models/studentData.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentDataProvider with ChangeNotifier {
  StudentData student = new StudentData();

  Future<bool> addStudent(
      String userID, String firebaseToken, StudentData data) async {
    print("IN PUT ");
    try {
      const url =
          'https://ey2qedvtz6.execute-api.ap-south-1.amazonaws.com/Student/students';

      print("USER ID " + userID);
      var body = {
        'userID': userID,
        'deviceToken': firebaseToken,
        'subjects': data.subjects,
        'name': data.name,
        'progress': data.progress,
        'email': data.email,
        'goals': data.goal,
        'school': 'Your School',
        'Class': data.standard,
        'address': 'New Delhi',
        'mobile': data.mobile,
        'dob': data.dob,
        'iconName': 'default',
        'compExams': data.compexams,
        'username': data.username
      };

      var response = await http.put(url, body: json.encode(body), headers: {
        'Content-Type': "application/json",
      });

      print(response.body);

      if (response.statusCode != 403) {
        getStudent(userID);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String> studentClass(String userID) async {
    if (student.standard != null) {
      return student.standard;
    } else {
      await getStudent(userID);
      return student.standard;
    }
  }

  Future<bool> updateStudent(
      String userID, String firebaseToken, StudentData data) async {
    try {
      var url =
          'https://ey2qedvtz6.execute-api.ap-south-1.amazonaws.com/Student/students/$userID';

      var body = {
        'userID': userID,
        'deviceToken': firebaseToken,
        'subjects': data.subjects,
        'name': data.name,
        'progress': data.progress,
        'email': data.email,
        'goals': data.goal,
        'school': 'Your School',
        'Class': data.standard,
        'address': 'New Delhi',
        'mobile': data.mobile,
        'dob': data.dob,
        'iconName': 'default',
        'compExams': data.compexams,
        'username': data.username
      };

      var response = await http.patch(url, body: json.encode(body), headers: {
        'Content-Type': "application/json",
      });

      print(response.body);

      if (response.statusCode != 403) {
        getStudent(userID);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getStudent(String id) async {
    print('INT GET STUDENT !');
    try {
      var url =
          'https://ey2qedvtz6.execute-api.ap-south-1.amazonaws.com/student/students/$id';

      //     userID: userID,
      // subjects: subjects,
      // progress: progress,
      // deviceToken:deviceToken,
      // goals:goals,
      // iconName:iconName,
      // email:email,
      // school:school,
      // Class:Class,
      // address:address,
      // mobile:mobile,
      // dob:dob

      var response = await http.get(url);
      var body = json.decode(response.body);
      if (body != null) {
        student.id = (body as Map<String, dynamic>)['userID'];
        student.subjects = (body as Map<String, dynamic>)['subjects'];
        student.username = (body as Map<String, dynamic>)['username'];
        student.progress = (body as Map<String, dynamic>)['progress'];
        student.compexams = (body as Map<String, dynamic>)['compExams'];
        student.dob = (body as Map<String, dynamic>)['dob'];
        student.goal = (body as Map<String, dynamic>)['goal'];
        student.mobile = (body as Map<String, dynamic>)['mobile'];
        student.standard = (body as Map<String, dynamic>)['Class'];
      }
    } catch (e) {
      return false;
    }

    return student != null ? true : false;
  }
}
