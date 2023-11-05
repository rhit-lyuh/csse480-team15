
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/course_schedule.dart';

class CoursescheduleDataDocumentManager {

  CourseSchedule? latestCourseschedule;

  final CollectionReference _ref;

  static final instance = CoursescheduleDataDocumentManager._privateConstructor();

  CoursescheduleDataDocumentManager._privateConstructor()
      : _ref =
            FirebaseFirestore.instance.collection(kCourseSchedulesCollectionPath);
          
  StreamSubscription startListening({
    required String dcoumentId,
    required Function observer,
  }) {
    return _ref.doc(dcoumentId).snapshots().listen(
      (DocumentSnapshot documentSnapshot) {
        latestCourseschedule = CourseSchedule.from(documentSnapshot);
        observer();
      }, onError: (error) {
        print("Error getting the document ${error}");
      });
  }

  void stopListening(StreamSubscription? subscription){
    subscription?.cancel();
  }

  void clearLatest() {
    latestCourseschedule = null;
  }

  bool get hasMon8 =>
      latestCourseschedule != null && latestCourseschedule!.mon8.isNotEmpty;
  String get mon8 => latestCourseschedule?.mon8 ?? "";
  
  bool get hasMon9 =>
      latestCourseschedule != null && latestCourseschedule!.mon9.isNotEmpty;
  String get mon9 => latestCourseschedule?.mon9 ?? "";

  bool get hasMon10 =>
      latestCourseschedule != null && latestCourseschedule!.mon10.isNotEmpty;
  String get mon10 => latestCourseschedule?.mon10 ?? "";

  bool get hasMon11 =>
      latestCourseschedule != null && latestCourseschedule!.mon11.isNotEmpty;
  String get mon11 => latestCourseschedule?.mon11 ?? "";

  bool get hasMon12 =>
      latestCourseschedule != null && latestCourseschedule!.mon12.isNotEmpty;
  String get mon12 => latestCourseschedule?.mon12 ?? "";

  bool get hasMon13 =>
      latestCourseschedule != null && latestCourseschedule!.mon13.isNotEmpty;
  String get mon13 => latestCourseschedule?.mon13 ?? "";

  bool get hasMon14 =>
      latestCourseschedule != null && latestCourseschedule!.mon14.isNotEmpty;
  String get mon14 => latestCourseschedule?.mon14 ?? "";

  bool get hasMon15 =>
      latestCourseschedule != null && latestCourseschedule!.mon15.isNotEmpty;
  String get mon15 => latestCourseschedule?.mon15 ?? "";

  bool get hasMon16 =>
      latestCourseschedule != null && latestCourseschedule!.mon16.isNotEmpty;
  String get mon16 => latestCourseschedule?.mon16 ?? "";  


  bool get hasTue8 =>
      latestCourseschedule != null && latestCourseschedule!.tue8.isNotEmpty;
  String get tue8 => latestCourseschedule?.tue8 ?? "";
  
  bool get hasTue9 =>
      latestCourseschedule != null && latestCourseschedule!.tue9.isNotEmpty;
  String get tue9 => latestCourseschedule?.tue9 ?? "";

  bool get hasTue10 =>
      latestCourseschedule != null && latestCourseschedule!.tue10.isNotEmpty;
  String get tue10 => latestCourseschedule?.tue10 ?? "";

  bool get hasTue11 =>
      latestCourseschedule != null && latestCourseschedule!.tue11.isNotEmpty;
  String get tue11 => latestCourseschedule?.tue11 ?? "";

  bool get hasTue12 =>
      latestCourseschedule != null && latestCourseschedule!.tue12.isNotEmpty;
  String get tue12 => latestCourseschedule?.tue12 ?? "";

  bool get hasTue13 =>
      latestCourseschedule != null && latestCourseschedule!.tue13.isNotEmpty;
  String get tue13 => latestCourseschedule?.tue13 ?? "";

  bool get hasTue14 =>
      latestCourseschedule != null && latestCourseschedule!.tue14.isNotEmpty;
  String get tue14 => latestCourseschedule?.tue14 ?? "";

  bool get hasTue15 =>
      latestCourseschedule != null && latestCourseschedule!.tue15.isNotEmpty;
  String get tue15 => latestCourseschedule?.tue15 ?? "";

  bool get hasTue16 =>
      latestCourseschedule != null && latestCourseschedule!.tue16.isNotEmpty;
  String get tue16 => latestCourseschedule?.tue16 ?? "";  

  bool get hasWed8 =>
      latestCourseschedule != null && latestCourseschedule!.wed8.isNotEmpty;
  String get wed8 => latestCourseschedule?.wed8 ?? "";
  
  bool get hasWed9 =>
      latestCourseschedule != null && latestCourseschedule!.wed9.isNotEmpty;
  String get wed9 => latestCourseschedule?.wed9 ?? "";

  bool get hasWed10 =>
      latestCourseschedule != null && latestCourseschedule!.wed10.isNotEmpty;
  String get wed10 => latestCourseschedule?.wed10 ?? "";

  bool get hasWed11 =>
      latestCourseschedule != null && latestCourseschedule!.wed11.isNotEmpty;
  String get wed11 => latestCourseschedule?.wed11 ?? "";

  bool get hasWed12 =>
      latestCourseschedule != null && latestCourseschedule!.wed12.isNotEmpty;
  String get wed12 => latestCourseschedule?.wed12 ?? "";

  bool get hasWed13 =>
      latestCourseschedule != null && latestCourseschedule!.wed13.isNotEmpty;
  String get wed13 => latestCourseschedule?.wed13 ?? "";

  bool get hasWed14 =>
      latestCourseschedule != null && latestCourseschedule!.wed14.isNotEmpty;
  String get wed14 => latestCourseschedule?.wed14 ?? "";

  bool get hasWed15 =>
      latestCourseschedule != null && latestCourseschedule!.wed15.isNotEmpty;
  String get wed15 => latestCourseschedule?.wed15 ?? "";

  bool get hasWed16 =>
      latestCourseschedule != null && latestCourseschedule!.wed16.isNotEmpty;
  String get wed16 => latestCourseschedule?.wed16 ?? "";  


  bool get hasThur8 =>
      latestCourseschedule != null && latestCourseschedule!.thur8.isNotEmpty;
  String get thur8 => latestCourseschedule?.thur8 ?? "";
  
  bool get hasThur9 =>
      latestCourseschedule != null && latestCourseschedule!.thur9.isNotEmpty;
  String get thur9 => latestCourseschedule?.thur9 ?? "";

  bool get hasThur10 =>
      latestCourseschedule != null && latestCourseschedule!.thur10.isNotEmpty;
  String get thur10 => latestCourseschedule?.thur10 ?? "";

  bool get hasThur11 =>
      latestCourseschedule != null && latestCourseschedule!.thur11.isNotEmpty;
  String get thur11 => latestCourseschedule?.thur11 ?? "";

  bool get hasThur12 =>
      latestCourseschedule != null && latestCourseschedule!.thur12.isNotEmpty;
  String get thur12 => latestCourseschedule?.thur12 ?? "";

  bool get hasThur13 =>
      latestCourseschedule != null && latestCourseschedule!.thur13.isNotEmpty;
  String get thur13 => latestCourseschedule?.thur13 ?? "";

  bool get hasThur14 =>
      latestCourseschedule != null && latestCourseschedule!.thur14.isNotEmpty;
  String get thur14 => latestCourseschedule?.thur14 ?? "";

  bool get hasThur15 =>
      latestCourseschedule != null && latestCourseschedule!.thur15.isNotEmpty;
  String get thur15 => latestCourseschedule?.thur15 ?? "";

  bool get hasThur16 =>
      latestCourseschedule != null && latestCourseschedule!.thur16.isNotEmpty;
  String get thur16 => latestCourseschedule?.thur16 ?? "";  


  bool get hasFri8 =>
      latestCourseschedule != null && latestCourseschedule!.fri8.isNotEmpty;
  String get fri8 => latestCourseschedule?.fri8 ?? "";
  
  bool get hasFri9 =>
      latestCourseschedule != null && latestCourseschedule!.fri9.isNotEmpty;
  String get fri9 => latestCourseschedule?.fri9 ?? "";

  bool get hasFri10 =>
      latestCourseschedule != null && latestCourseschedule!.fri10.isNotEmpty;
  String get fri10 => latestCourseschedule?.fri10 ?? "";

  bool get hasFri11 =>
      latestCourseschedule != null && latestCourseschedule!.fri11.isNotEmpty;
  String get fri11 => latestCourseschedule?.fri11 ?? "";

  bool get hasFri12 =>
      latestCourseschedule != null && latestCourseschedule!.fri12.isNotEmpty;
  String get fri12 => latestCourseschedule?.fri12 ?? "";

  bool get hasFri13 =>
      latestCourseschedule != null && latestCourseschedule!.fri13.isNotEmpty;
  String get fri13 => latestCourseschedule?.fri13 ?? "";

  bool get hasFri14 =>
      latestCourseschedule != null && latestCourseschedule!.fri14.isNotEmpty;
  String get fri14 => latestCourseschedule?.fri14 ?? "";

  bool get hasFri15 =>
      latestCourseschedule != null && latestCourseschedule!.fri15.isNotEmpty;
  String get fri15 => latestCourseschedule?.fri15 ?? "";

  bool get hasFri16 =>
      latestCourseschedule != null && latestCourseschedule!.fri16.isNotEmpty;
  String get fri16 => latestCourseschedule?.fri16 ?? "";  

}