import 'package:STUDYtable/models/deadlines.dart';
import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/models/subjects.dart';
import 'package:STUDYtable/models/updates.dart';
import 'package:STUDYtable/providers/student_provider.dart';
import 'package:STUDYtable/screens/my_studytable.dart';
import 'package:STUDYtable/screens/tabs_screen.dart';
import 'package:STUDYtable/widgets/deadline_list.dart';
import 'package:STUDYtable/widgets/footer.dart';
import 'package:STUDYtable/widgets/header.dart';
import 'package:STUDYtable/widgets/new_deadline.dart';
import 'package:STUDYtable/widgets/subject_item.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:button3d/button3d.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FinalPersonal extends StatefulWidget {
  final StudentData data;
  FinalPersonal({Key key, this.data}) : super(key: key);
  @override
  _FinalPersonalState createState() => _FinalPersonalState();
}

class _FinalPersonalState extends State<FinalPersonal> {
  var userId = null;
  var firebaseToken = null;

  var isDataAvailable = false;

  void _fetchSession() async {
    try {
      if (widget.data != null) {
        await Amplify.Auth.signIn(
            username: widget.data.email, password: widget.data.mobile);
      }
      CognitoAuthSession res = await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true));
      print(res.userSub);
      userId = res.userSub;
      studentCheck();
    } on AuthError catch (e) {
      userId = null;
      print(e);
    }
  }

  final List<Deadlines> _userdeadline = [];

  void _addNewDeadline(
    String dTitle,
    DateTime chosenDate,
  ) {
    final newDl = Deadlines(
      id: DateTime.now().toString(),
      title: dTitle,
      date: chosenDate,
    );
    setState(() {
      _userdeadline.add(newDl);
    });
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void giveMeToken() async {
    String id = await _firebaseMessaging.getToken();
    firebaseToken = id;
    print(id);
  }

  void studentCheck() async {
    bool checkStudent =
        await Provider.of<StudentDataProvider>(context, listen: false)
            .getStudent(userId);
    if (checkStudent) {
      setState(() {
        isDataAvailable = true;
      });
      return;
    } else {
      bool checkStudent =
          await Provider.of<StudentDataProvider>(context, listen: false)
              .addStudent(userId, firebaseToken, widget.data);
      if (checkStudent) {
        setState(() {
          isDataAvailable = true;
        });
      }
    }
  }

  @override
  void initState() {
    giveMeToken();
    _fetchSession();
    fetchSubjects();
    super.initState();
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
    });
  }

  void fetchSubjects() async {
    String standard =
        await Provider.of<StudentDataProvider>(context).studentClass(userId);
    await Provider.of<Subjects>(context, listen: false).fetchSubjects(standard);
  }

  void _startAddNewDeadline(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewDeadline(_addNewDeadline),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteDeadline(String id) {
    setState(() {
      _userdeadline.removeWhere((dl) {
        return dl.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildSubjectCard(
      String title,
      String url,
      double fontSize,
    ) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.42,
            height: MediaQuery.of(context).size.height * 0.27,
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
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  title,
                  style: GoogleFonts.lato(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final dlListWidget = Container(
      height: 200,
      child: DeadlineList(_userdeadline, _deleteDeadline),
    );

    List<Updates> _favoriteposts = [];

    final subjectsData = Provider.of<Subjects>(context);
    final subjects = subjectsData.items;

    return RefreshIndicator(
      onRefresh: () {
        fetchSubjects();
        return;
      },
      child: Scaffold(
        backgroundColor: Color(0xfff8f8ff),
        body: isDataAvailable
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: 'login',
                      child: Container(
                        child: Header(),
                        margin: EdgeInsets.only(top: 10),
                      ),
                    ),
                    MediaQuery.removePadding(
                      removeTop: true,
                      removeBottom: true,
                      context: context,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.85,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                            value: subjects[i],
                            child: SubjectItem(),
                          ),
                          itemCount: subjects.length,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/images/faceicon.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        GestureDetector(
                          child: _buildSubjectCard('\t\tMy\n \tSTUDYtable',
                              'lib/assets/images/studytablenew.png', 24),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyStudytable(
                                      // data: widget.data,
                                      ))),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: Text(
                        '" Hello, I am Bittu. I like to play football and music. I study in RK Puram, Delhi. Physics is my favourite subject. "',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.30,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'News and updates',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Center(
                                    child: Text(
                                        '***** Latest Update goes here *****')),
                              ),
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      text: 'See all Updates >>',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TabsScreen(
                                                  _favoriteposts,
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                alignment: Alignment.bottomRight,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 280,
                      child: dlListWidget,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Button3d(
                          onPressed: () => _startAddNewDeadline(context),
                          child: Text(
                            'Add Deadline  + ',
                            style: GoogleFonts.lato(
                              fontSize: 17,
                            ),
                          ),
                          style: Button3dStyle(
                              borderRadius: BorderRadius.circular(50),
                              topColor: Colors.blue[100],
                              backColor: Colors.blue[200]),
                          width: 150,
                          height: 60,
                        ),
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
              )
            : Center(
                child: Text('Loading Data'),
              ),
      ),
    );
  }
}
