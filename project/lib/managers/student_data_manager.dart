import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/student_data.dart';

class StudentDataDocumentManager {
  StudentData? latestStudentData;
  final CollectionReference _ref;

  static final instance = StudentDataDocumentManager._privateConstructor();
  StudentDataDocumentManager._privateConstructor()
      : _ref =
            FirebaseFirestore.instance.collection(kStudentDataCollectionPath);

  StreamSubscription startListening({
    required String documentId,
    required Function observer,
  }) {
    return _ref.doc(documentId).snapshots().listen(
        (DocumentSnapshot documentSnapshot) {
      latestStudentData = StudentData.from(documentSnapshot);
      observer();
    }, onError: (error) {
      print("Error getting the document $error");
    });
  }

  void stopListening(StreamSubscription? subscription) {
    subscription?.cancel();
  }
  
  void update({
    required String username, 
    required String major, 
    required String minor,
    required String year,
    required String academicStanding}
    ) {
      final updateMap = {
        kStudentDataDisplayName: username,
        kStudentDataMajor: major,
        kStudentDataMinor: minor,
        kStudentDataYear: year,
      };
      _ref.doc(latestStudentData!.documentId!).update(updateMap).then((_) {
      print("Finished updating the document");
    }).catchError((error) {
      print("There was an error adding the document $error");
    });
    }

  void clearLatest() {
    latestStudentData = null;
  }

  bool get hasDisplayName =>
      latestStudentData != null && latestStudentData!.username.isNotEmpty;
  String get displayName => latestStudentData?.username ?? "";

  bool get hasMajor =>
      latestStudentData != null && latestStudentData!.major.isNotEmpty;
  String get major => latestStudentData?.major ?? "";

  bool get hasMinor =>
      latestStudentData != null && latestStudentData!.minor.isNotEmpty;
  String get minor => latestStudentData?.minor ?? "";

  bool get hasYear =>
      latestStudentData != null && latestStudentData!.year.isNotEmpty;
  String get year => latestStudentData?.year ?? "";

  bool get hasAcademic =>
      latestStudentData != null && latestStudentData!.academic.isNotEmpty;
  String get academic => latestStudentData?.academic ?? "";
}
