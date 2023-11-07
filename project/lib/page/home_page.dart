import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/component/list_page_drawer.dart';
import 'package:project/component/profile_card.dart';
import 'package:project/component/profile_dialog.dart';
import 'package:project/managers/auth_manager.dart';
import 'package:project/managers/student_data_manager.dart';
import 'package:project/managers/user_data_document_manager.dart';
import 'package:project/model/student_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  StreamSubscription? _studentDataSubscription;
  UniqueKey? _loginUniqueKey;
  UniqueKey? _logoutUniqueKey;
  
  final usernameTextController = TextEditingController();
  final yearTextController = TextEditingController();
  final majorTextController = TextEditingController();
  final minorTextController = TextEditingController();
  final academicStandingtextController = TextEditingController();

  @override
  void initState() {
    _studentDataSubscription = StudentDataDocumentManager.instance.startListening(
      documentId: AuthManager.instance.uid, 
      observer: () {
        setState(() {
          
        });
        print("username: ${StudentDataDocumentManager.instance.displayName}");
        print("year: ${StudentDataDocumentManager.instance.year}");
        print("academic: ${StudentDataDocumentManager.instance.academic}");
        print("major: ${StudentDataDocumentManager.instance.major}");
        print("minor: ${StudentDataDocumentManager.instance.minor}");

        

      }
    );

    _loginUniqueKey = AuthManager.instance.addLoginObserver(() {
      if (StudentDataDocumentManager.instance.hasDisplayName) {
        
      } else {
        StudentDataDocumentManager.instance.maybeAddNewUser();
      }
        
      setState(() {});
    });

    _logoutUniqueKey = AuthManager.instance.addLogoutObserver(() {
      setState(() {
            
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    usernameTextController.dispose();
    yearTextController.dispose();
    majorTextController.dispose();
    minorTextController.dispose();
    academicStandingtextController.dispose();
    StudentDataDocumentManager.instance.stopListening(_studentDataSubscription);
    AuthManager.instance.removeObserver(_loginUniqueKey);
    AuthManager.instance.removeObserver(_logoutUniqueKey);
    super.dispose();
  }

  /// The currently selecte
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Rose-Hulman",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff800000),
      ),
      drawer: const ListPageDrawer(),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(40.0)),
            ProfileCard(
              username: StudentDataDocumentManager.instance.displayName, 
              year: StudentDataDocumentManager.instance.year, 
              major: StudentDataDocumentManager.instance.major, 
              minor: StudentDataDocumentManager.instance.minor, 
              academic: StudentDataDocumentManager.instance.academic, 
              onPressedCallback: () { 
                showEditProfileDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  void showEditProfileDialog() {
    showDialog(
      context: context, 
      builder: (context) {
        usernameTextController.text = StudentDataDocumentManager.instance.displayName;
        yearTextController.text = StudentDataDocumentManager.instance.year;
        majorTextController.text = StudentDataDocumentManager.instance.major;
        minorTextController.text = StudentDataDocumentManager.instance.minor;
        academicStandingtextController.text = StudentDataDocumentManager.instance.academic;
        return ProfileDialog(
          usernameTextController: usernameTextController, 
          yearTextController: yearTextController, 
          majorTextController: majorTextController, 
          minorTextController: minorTextController, 
          academicStandingtextController: academicStandingtextController, 
          positiveActionCallback: () { 
            StudentDataDocumentManager.instance.update(
              username: usernameTextController.text, 
              major: majorTextController.text, 
              minor: minorTextController.text, 
              year: yearTextController.text, 
              academicStanding: academicStandingtextController.text
            );
          }, 
          onYearSelectedCallback: (String? value) { 
            setState(() {
              yearTextController.text = value!;
            });
          }, 
          onMajorSelectedCallback: (String? value) {
            setState(() {
              majorTextController.text = value!;
            });
          }, 
          onMinorSelectedCallback: (String? value) {
            setState(() {
              minorTextController.text = value!;
            });
          }, 
          onAcademicSelectedCallback: (String? value) {
            setState(() {
              academicStandingtextController.text = value!;
            });
          },);
      }
    );
  }
}
