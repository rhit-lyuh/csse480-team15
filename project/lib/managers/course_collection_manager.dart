import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/user_data.dart';

class CoursesCollectionManager {
  // Not actually need after the Firebase UI Firestore refactor
  List<UserData> latestCourses = [];

  final CollectionReference _ref;

  static final instance = CoursesCollectionManager._privateConstructor();
  CoursesCollectionManager._privateConstructor()
      : _ref = FirebaseFirestore.instance.collection("Courses");

  // Not actually need after the Firebase UI Firestore refactor
  StreamSubscription startListening(Function observer) {
    return _ref.snapshots().listen((QuerySnapshot querySnapshot) {
      latestCourses = querySnapshot.docs.map((doc) {
        return UserData.from(doc);
      }).toList();
      observer();
    }, onError: (error) {
      print("Error listening $error");
    });
  }

  // Not actually need after the Firebase UI Firestore refactor
  void stopListening(StreamSubscription? subscription) {
    subscription?.cancel();
  }

  bool hasCourse(String courseName) {
    for (var u in latestCourses) {
      if (u.documentId == courseName) {
        return true;
      }
    }
    return false;
  }
}
