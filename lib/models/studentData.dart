class StudentData {
  String id;
  String name;
  String email;
  String mobile;
  String username;
  String goal;
  String dob;
  String standard;
  List<dynamic> compexams;
  List<dynamic> subjects;
  Map<String, dynamic> progress;

  StudentData({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.username,
    this.goal,
    this.dob,
    this.standard,
    this.compexams,
    this.subjects,
    this.progress,
  });

  Map<String, dynamic> settoMap() {
    return {
      "email": email,
      "phone_number": mobile,
      'preferred_username': username,
      "name": name,
      "birthdate": dob,
      "address": "Universe1",
      // "subjects": subjects.toString(),
    };
  }

  // static StudentData fromMap(Map<String, dynamic> map) {
  //   return StudentData(
  //     id: map['id'],
  //     name: map['name'],
  //     email: map['email'],
  //     mobile: map['mobile'],
  //     username: map['username'],
  //     goal: map['goal'],
  //     subjects: map['subjects'],
  //   );
  // }
}
