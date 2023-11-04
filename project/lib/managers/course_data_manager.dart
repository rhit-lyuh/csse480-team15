import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/course.dart';

class CourseDataDocumentManager {
  Course? latestCourseData;
  final CollectionReference _ref;

  static final instance = CourseDataDocumentManager._privateConstructor();
  CourseDataDocumentManager._privateConstructor()
      : _ref = FirebaseFirestore.instance.collection(kCourseCollectionPath);

  StreamSubscription startListening({
    required String documentId,
    required Function observer,
  }) {
    return _ref.doc(documentId).snapshots().listen(
        (DocumentSnapshot documentSnapshot) {
      latestCourseData = Course.from(documentSnapshot);
      observer();
    }, onError: (error) {
      print("Error getting the document $error");
    });
  }

  void stopListening(StreamSubscription? subscription) {
    subscription?.cancel();
  }

  void clearLatest() {
    latestCourseData = null;
  }
}
